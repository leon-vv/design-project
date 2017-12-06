import os.path

# Project structure
project = {
    "shared": {
        "SR-flip-flop": [],
        "four-adder": [("full-adder", "shared")],
        "full-adder": []
    },
    "task1": {
        # No dependencies beside mux1-2to1.vhd and test bench
        "mux1-2to1": [],

        # Depends on mux1-2to1 which is inside task 1
        "mux4-2to1": [("mux1-2to1", "task1")],
        
        "reg": [("SR-flip-flop", "shared")]
    },
    "task2": {
        "alu": [("four-adder", "shared")],
        "status-reg": [("SR-flip-flop", "shared")]
    },
    "task3": {
        "program-counter": [
            ("four-adder", "shared"), 
            ("SR-flip-flop", "shared"),
            ("mux4-2to1", "task1")]
    }
}

def prefix_dir(dir_, name, suffix):
    return dir_ + "/" + name + "/" + name + suffix

def to_vhdl_name(name):
    return name.replace("-", "_")

def task_wave_files():

    for dir_, files in project.items():

        yield {
            "basename": "_build_directory_" + dir_,
            "clean": True,
            "targets": ["build/" + dir_],
            "actions": ["mkdir -p build/" + dir_]
        }

        for name, deps in files.items():
            vhdl_name = to_vhdl_name(name)
            base_file = prefix_dir(dir_, name, ".vhd")
            test_bench = prefix_dir(dir_, name, "-tb.vhd")

            target = "build/" + dir_ + "/" + name + ".vcd"
            dependencies = [prefix_dir(dep[1], dep[0], ".vhd") for dep in deps] + [base_file]
            actions = ["ghdl_mcode -a " + base_file]

            tb_exists = os.path.isfile(test_bench)

            if tb_exists:
                dependencies.append(test_bench)
                actions += [
                        "ghdl_mcode -a " + test_bench,
                        "ghdl_mcode -r " + vhdl_name + "_tb --vcd=" + target + " --stop-time=10us "]

            title = "Creating " + target if tb_exists else "Analysing " + vhdl_name

            yield {
                "basename": vhdl_name,
                "clean": True,
                "targets": [target],
                "task_dep": [to_vhdl_name(dep[0]) for dep in deps],
                "file_dep": dependencies,
                "setup": ["_build_directory_" + dir_],
                "actions": actions,
                "title": (lambda v: lambda t: v)(title) # Scoping issues
            }

            
