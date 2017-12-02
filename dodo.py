# Project structure
project = {
    "shared": {
        "SR-flip-flop": []
    },
    "task1": {
        # No dependencies beside mux1-2to1.vhd and test bench
        "mux1-2to1": [],

        # Depends on mux1-2to1 which is inside task 1
        "mux4-2to1": [("mux1-2to1", "task1")],
        
        "reg": [("SR-flip-flop", "shared")]
    },
    "task2": {
        "alu": [],
        "status-reg": [("SR-flip-flop", "shared")]
    }
}

def prefix_dir(dir_, name, suffix):
    return dir_ + "/" + name + "/" + name + suffix

def task_wave_files():

    for dir_, files in project.items():

        yield {
            "basename": "_build_directory_" + dir_,
            "clean": True,
            "targets": ["build/" + dir_],
            "actions": ["mkdir -p build/" + dir_]
        }

        for name, deps in files.items():
            vhdl_name = name.replace("-", "_")
            base_file = prefix_dir(dir_, name, ".vhd")
            test_bench = prefix_dir(dir_, name, "-tb.vhd")

            target = "build/" + dir_ + "/" + name + ".vcd"
            dependencies = [prefix_dir(dep[1], dep[0], ".vhd") for dep in deps] + [base_file, test_bench]

            actions = [
                "ghdl_mcode -a " + base_file,
                "ghdl_mcode -a " + test_bench,
                "ghdl_mcode -r " + vhdl_name + "_tb --vcd=" + target + " --stop-time=10us "]

            yield {
                "basename": vhdl_name,
                "clean": True,
                "targets": [target],
                "file_dep": dependencies,
                "setup": ["_build_directory_" + dir_],
                "actions": actions,
                "title": lambda t: "Creating " + t.targets[0]
            }

            
