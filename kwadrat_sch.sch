<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="VGA_R" />
        <signal name="VGA_G" />
        <signal name="VGA_B" />
        <signal name="VGA_HSYNC" />
        <signal name="VGA_VSYNC" />
        <signal name="PS2_Data" />
        <signal name="PS2_Clk" />
        <signal name="LED_0" />
        <signal name="XLXN_10(7:0)" />
        <signal name="XLXN_11(7:0)" />
        <signal name="XLXN_12(7:0)" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14(10:0)" />
        <signal name="XLXN_15(10:0)" />
        <signal name="clk" />
        <signal name="btn_north" />
        <signal name="XLXN_16" />
        <port polarity="Output" name="VGA_R" />
        <port polarity="Output" name="VGA_G" />
        <port polarity="Output" name="VGA_B" />
        <port polarity="Output" name="VGA_HSYNC" />
        <port polarity="Output" name="VGA_VSYNC" />
        <port polarity="BiDirectional" name="PS2_Data" />
        <port polarity="BiDirectional" name="PS2_Clk" />
        <port polarity="Output" name="LED_0" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="btn_north" />
        <blockdef name="PS2_Mouse">
            <timestamp>2024-4-11T8:37:0</timestamp>
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <rect width="256" x="64" y="-448" height="448" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
        </blockdef>
        <blockdef name="mysz">
            <timestamp>2024-6-4T8:10:23</timestamp>
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="368" y="-300" height="24" />
            <line x2="432" y1="-288" y2="-288" x1="368" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
            <rect width="304" x="64" y="-320" height="384" />
        </blockdef>
        <blockdef name="kwadrat">
            <timestamp>2024-6-4T8:26:21</timestamp>
            <line x2="384" y1="416" y2="416" x1="320" />
            <rect width="64" x="0" y="276" height="24" />
            <line x2="0" y1="288" y2="288" x1="64" />
            <rect width="64" x="0" y="340" height="24" />
            <line x2="0" y1="352" y2="352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-320" height="768" />
        </blockdef>
        <block symbolname="PS2_Mouse" name="XLXI_2">
            <blockpin signalname="PS2_Data" name="PS2_Data" />
            <blockpin signalname="PS2_Clk" name="PS2_Clk" />
            <blockpin signalname="LED_0" name="InitOK" />
            <blockpin signalname="XLXN_13" name="DataRdy" />
            <blockpin signalname="XLXN_10(7:0)" name="B1_Status(7:0)" />
            <blockpin signalname="XLXN_11(7:0)" name="B2_X(7:0)" />
            <blockpin signalname="XLXN_12(7:0)" name="B3_Y(7:0)" />
            <blockpin signalname="clk" name="Clk_50MHz" />
            <blockpin signalname="btn_north" name="Reset" />
            <blockpin signalname="clk" name="Clk_Sys" />
        </block>
        <block symbolname="mysz" name="XLXI_11">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="XLXN_13" name="DataRdy" />
            <blockpin signalname="XLXN_10(7:0)" name="B1_Status(7:0)" />
            <blockpin signalname="XLXN_11(7:0)" name="B2_X(7:0)" />
            <blockpin signalname="XLXN_12(7:0)" name="B3_Y(7:0)" />
            <blockpin signalname="XLXN_14(10:0)" name="pos_x(10:0)" />
            <blockpin signalname="XLXN_15(10:0)" name="pos_y(10:0)" />
            <blockpin signalname="XLXN_16" name="mReset" />
        </block>
        <block symbolname="kwadrat" name="XLXI_15">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="XLXN_14(10:0)" name="pos_x(10:0)" />
            <blockpin signalname="XLXN_15(10:0)" name="pos_y(10:0)" />
            <blockpin signalname="VGA_R" name="vga_r" />
            <blockpin signalname="VGA_G" name="vga_g" />
            <blockpin signalname="VGA_B" name="vga_b" />
            <blockpin signalname="VGA_HSYNC" name="vga_hsync" />
            <blockpin signalname="VGA_VSYNC" name="vga_vsync" />
            <blockpin signalname="XLXN_16" name="mReset" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="VGA_R">
            <wire x2="2640" y1="928" y2="928" x1="1968" />
            <wire x2="2640" y1="928" y2="944" x1="2640" />
            <wire x2="2656" y1="944" y2="944" x1="2640" />
        </branch>
        <branch name="VGA_G">
            <wire x2="2640" y1="992" y2="992" x1="1968" />
            <wire x2="2640" y1="992" y2="1008" x1="2640" />
            <wire x2="2656" y1="1008" y2="1008" x1="2640" />
        </branch>
        <branch name="VGA_B">
            <wire x2="2640" y1="1056" y2="1056" x1="1968" />
            <wire x2="2640" y1="1056" y2="1072" x1="2640" />
            <wire x2="2656" y1="1072" y2="1072" x1="2640" />
        </branch>
        <branch name="VGA_HSYNC">
            <wire x2="2640" y1="1120" y2="1120" x1="1968" />
            <wire x2="2640" y1="1120" y2="1136" x1="2640" />
            <wire x2="2656" y1="1136" y2="1136" x1="2640" />
        </branch>
        <branch name="VGA_VSYNC">
            <wire x2="2640" y1="1184" y2="1184" x1="1968" />
            <wire x2="2640" y1="1184" y2="1200" x1="2640" />
            <wire x2="2656" y1="1200" y2="1200" x1="2640" />
        </branch>
        <iomarker fontsize="28" x="2656" y="944" name="VGA_R" orien="R0" />
        <iomarker fontsize="28" x="2656" y="1008" name="VGA_G" orien="R0" />
        <iomarker fontsize="28" x="2656" y="1072" name="VGA_B" orien="R0" />
        <iomarker fontsize="28" x="2656" y="1136" name="VGA_HSYNC" orien="R0" />
        <iomarker fontsize="28" x="2656" y="1200" name="VGA_VSYNC" orien="R0" />
        <instance x="352" y="1520" name="XLXI_2" orien="R0">
        </instance>
        <branch name="PS2_Data">
            <wire x2="816" y1="1104" y2="1104" x1="736" />
            <wire x2="816" y1="640" y2="1104" x1="816" />
            <wire x2="2640" y1="640" y2="640" x1="816" />
        </branch>
        <branch name="PS2_Clk">
            <wire x2="800" y1="1168" y2="1168" x1="736" />
            <wire x2="800" y1="688" y2="1168" x1="800" />
            <wire x2="2640" y1="688" y2="688" x1="800" />
        </branch>
        <branch name="LED_0">
            <wire x2="784" y1="1232" y2="1232" x1="736" />
            <wire x2="784" y1="752" y2="1232" x1="784" />
            <wire x2="2640" y1="752" y2="752" x1="784" />
        </branch>
        <iomarker fontsize="28" x="2640" y="640" name="PS2_Data" orien="R0" />
        <iomarker fontsize="28" x="2640" y="688" name="PS2_Clk" orien="R0" />
        <iomarker fontsize="28" x="2640" y="752" name="LED_0" orien="R0" />
        <branch name="XLXN_10(7:0)">
            <wire x2="928" y1="1296" y2="1296" x1="736" />
        </branch>
        <branch name="XLXN_11(7:0)">
            <wire x2="928" y1="1360" y2="1360" x1="736" />
        </branch>
        <branch name="XLXN_12(7:0)">
            <wire x2="928" y1="1424" y2="1424" x1="736" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="832" y1="1488" y2="1488" x1="736" />
            <wire x2="832" y1="1232" y2="1488" x1="832" />
            <wire x2="928" y1="1232" y2="1232" x1="832" />
        </branch>
        <branch name="XLXN_14(10:0)">
            <wire x2="1376" y1="1168" y2="1168" x1="1360" />
            <wire x2="1472" y1="1168" y2="1168" x1="1376" />
            <wire x2="1472" y1="1168" y2="1504" x1="1472" />
            <wire x2="1568" y1="1504" y2="1504" x1="1472" />
            <wire x2="1584" y1="1504" y2="1504" x1="1568" />
        </branch>
        <branch name="XLXN_15(10:0)">
            <wire x2="1376" y1="1424" y2="1424" x1="1360" />
            <wire x2="1456" y1="1424" y2="1424" x1="1376" />
            <wire x2="1456" y1="1424" y2="1568" x1="1456" />
            <wire x2="1568" y1="1568" y2="1568" x1="1456" />
            <wire x2="1584" y1="1568" y2="1568" x1="1568" />
        </branch>
        <branch name="clk">
            <wire x2="256" y1="1680" y2="1680" x1="112" />
            <wire x2="864" y1="1680" y2="1680" x1="256" />
            <wire x2="912" y1="1680" y2="1680" x1="864" />
            <wire x2="352" y1="1424" y2="1424" x1="256" />
            <wire x2="256" y1="1424" y2="1488" x1="256" />
            <wire x2="256" y1="1488" y2="1680" x1="256" />
            <wire x2="352" y1="1488" y2="1488" x1="256" />
            <wire x2="864" y1="1168" y2="1680" x1="864" />
            <wire x2="928" y1="1168" y2="1168" x1="864" />
            <wire x2="912" y1="928" y2="1680" x1="912" />
            <wire x2="1568" y1="928" y2="928" x1="912" />
            <wire x2="1584" y1="928" y2="928" x1="1568" />
        </branch>
        <branch name="btn_north">
            <wire x2="256" y1="1744" y2="1744" x1="112" />
            <wire x2="304" y1="1744" y2="1744" x1="256" />
            <wire x2="304" y1="1360" y2="1744" x1="304" />
            <wire x2="352" y1="1360" y2="1360" x1="304" />
        </branch>
        <iomarker fontsize="28" x="112" y="1680" name="clk" orien="R180" />
        <iomarker fontsize="28" x="112" y="1744" name="btn_north" orien="R180" />
        <instance x="928" y="1456" name="XLXI_11" orien="R0">
        </instance>
        <branch name="XLXN_16">
            <wire x2="848" y1="1488" y2="1760" x1="848" />
            <wire x2="2048" y1="1760" y2="1760" x1="848" />
            <wire x2="912" y1="1488" y2="1488" x1="848" />
            <wire x2="928" y1="1488" y2="1488" x1="912" />
            <wire x2="2048" y1="1632" y2="1632" x1="1968" />
            <wire x2="2048" y1="1632" y2="1760" x1="2048" />
        </branch>
        <instance x="1584" y="1216" name="XLXI_15" orien="R0">
        </instance>
    </sheet>
</drawing>