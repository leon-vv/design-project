# Project structure
files = [
    {
        # No dependencies beside mux1-2to1.vhd and test bench
        "mux1-2to1": [],

        # Depends on mux1-2to1 which is inside task 1
        "mux4-2to1": [("mux1-2to1", 1)],
        
        "reg": []
    },
    {
        "alu": []        
    }
]

def prefix_dir(name, suffix, task_num):
    return "task" + str(task_num) + "/" + name + "/" + name + suffix

def task_wave_files():

    task_num = 0

    for task in files:
        task_num += 1

        for name, deps in task.items():
            vhdl_name = name.replace("-", "_")
            base_file = prefix_dir(name, ".vhd", task_num)
            test_bench = prefix_dir(name, "-tb.vhd", task_num)

            target = "build/task" + str(task_num) + "/" + name + ".vcd"
            dependencies = [prefix_dir(dep[0], ".vhd", dep[1]) for dep in deps] + [base_file, test_bench]

            actions = [
                "ghdl_mcode -a " + base_file,
                "ghdl_mcode -a " + test_bench,
                "ghdl_mcode -r " + vhdl_name + "_tb --vcd=" + target + " --stop-time=3000ns "]

            yield {
                "basename": vhdl_name,
                "clean": True,
                "targets": [target],
                "file_dep": dependencies,
                "setup": ["_build_directory" + str(task_num)],
                "actions": actions,
                "title": lambda t: "Creating " + t.targets[0]
            }

def task_build_directory():
    task_num = 0

    for task in files:
        task_num += 1

        yield {
            "basename": "_build_directory" + str(task_num),
            "clean": True,
            "targets": ["build/task" + str(task_num)],
            "actions": ["mkdir -p build/task" + str(task_num)]
        }
