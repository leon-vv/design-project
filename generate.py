import os
rootdir = '../'

begin = open("projectbegin.txt", "r")
end = open("projectend.txt", "r")
xise = open("../project.xise", "w")

xise.write(begin.read())
begin.close()

for subdir, dirs, files in os.walk(rootdir):
    path = subdir[3:] + "/"
    for file in files:
        if file.endswith(".vhd"):
            if file.endswith("-tb.vhd"):
                xise.write("<file xil_pn:name=\""+path+file+" xil_pn:type=\"FILE_VHDL\">\n")
                xise.write("<association xil_pn:name=\"BehavioralSimulation\"/>\n")
                xise.write("<association xil_pn:name=\"PostMapSimulation\"/>\n")
                xise.write("<association xil_pn:name=\"PostRouteSimulation\"/>\n")
                xise.write("<association xil_pn:name=\"PostTranslateSimulation\"/>\n")
                xise.write("</file>\n")
            else:
                xise.write("<file xil_pn:name=\""+path+file+"\" xil_pn:type=\"FILE_VHDL\">\n<association xil_pn:name=\"BehavioralSimulation\"/>\n<association xil_pn:name=\"Implementation\"/>\n</file>\n")

xise.write(end.read())
xise.close()
end.close()
