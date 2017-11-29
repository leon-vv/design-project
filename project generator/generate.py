import os
rootdir = '../'

begin = open("projectbegin.txt", "r")
end = open("projectend.txt", "r")
xise = open("project.xise", "w")

xise.write(begin.read())
begin.close()

for subdir, dirs, files in os.walk(rootdir):
    path = subdir[3:] + "/"
    for file in files:
        if file.endswith(".vhd"):
            if file.endswith("-tb.vhd"):
                xise.write("<file xil_pn:name=\""+path+file+" xil_pn:type=\"FILE_VHDL\">")
                xise.write("<association xil_pn:name=\"BehavioralSimulation\"/>")
                xise.write("<association xil_pn:name=\"PostMapSimulation\"/>")
                xise.write("<association xil_pn:name=\"PostRouteSimulation\"/>")
                xise.write("<association xil_pn:name=\"PostTranslateSimulation\"/>")
                xise.write("</file>\n")
            else:
                xise.write("<file xil_pn:name=\""+path+file+"\" xil_pn:type=\"FILE_VHDL\"><association xil_pn:name=\"BehavioralSimulation\"/><association xil_pn:name=\"Implementation\"/></file>\n")

xise.write(end.read())
xise.close()
end.close()
