files = [
    ["mux2-to-1", "mux4-to-1", "reg"] # Task 1
]

def prefix_dir(name, suffix, task_num):
    return "task" + str(task_num) + "/" + name + "/" + name + suffix

def task_all():
    i = 0

    for directory in files:
        i += 1

        actions = []

        for name in directory:
            vhdl_name = name.replace("-", "_")
            target = "build/task" + str(i) + "/" + name + ".vcd"
            subactions = [
                "ghdl_mcode -a " + prefix_dir(name, ".vhd", i),
                "ghdl_mcode -a " + prefix_dir(name, "-tb.vhd", i),
                "ghdl_mcode -r " + vhdl_name + "_tb --vcd=" + target + " --stop-time=3000ns "]
            actions.extend(subactions)

        yield {
            'basename': "task" + str(i),
            'actions': actions
        }
