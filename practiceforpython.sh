  #!/bin/bash

  ## Lines

  line="\033[32m-------------------------------------------------\033[0m"


  ## Results

  ################ smallest #################

  smallest()
  {
    cpu=8
    ram=48
    root=300
    boot=1
    mnt=50
    swap=`expr $ram / 3`
    vm=VM1
    echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/smallest
    echo -e $vm:$cpu:$ram:$root:$boot:$swap:$mnt >> /tmp/smallest
    echo -e $line
    cat /tmp/smallest | column -t -s ":"
    echo -e $line
  }

  ################ Classic without Optional ########################

  c_standard_withoutoptional()
  {
    cpu=18
    ram=96
    root=500
    boot=1
    mnt=50
    swap=`expr $ram / 3`
    vm=VM1
    echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/c_standard_withoutoptional
    echo -e $vm:$cpu:$ram:$root:$boot:$swap:$mnt >> /tmp/c_standard_withoutoptional
    echo -e $line
    cat /tmp/c_standard_withoutoptional | column -t -s ":"
    echo -e $line
  }

  c_large_withoutoptional()
  {
    cpu=24
    ram=128
    root=974
    boot=1
    mnt=50
    swap=`expr $ram / 3`
    vm=VM1
    echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/c_large_withoutoptional
    echo -e $vm:$cpu:$ram:$root:$boot:$swap:$mnt >> /tmp/c_large_withoutoptional
    echo -e $line
    cat /tmp/c_large_withoutoptional | column -t -s ":"
    echo -e $line
  }

  c_xl_withoutoptional()
  {
    cpu=32
    ram=192
    root=974
    boot=1
    mnt=50
    swap=`expr $ram / 3`
    vm=VM1
    echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/c_xl_withoutoptional
    echo -e $vm:$cpu:$ram:$root:$boot:$swap:$mnt >> /tmp/c_xl_withoutoptional
    echo -e $line
    cat /tmp/c_xl_withoutoptional | column -t -s ":"
    echo -e $line
  }

  ################ Classic With Optional #######################################

  opts()
  {
    wsrcs_cpu=0
    wsrclxl_cpu=0
    wsrcs_ram=0
    wsrclxl_ram=0
    wsos_cpu=0
    wsolxl_cpu=0
    wsos_ram=0
    wsolxl_ram=0
    wsss_cpu=0
    wsslxl_cpu=0
    wsss_ram=0
    wsslxl_ram=0
    nna_cpu=0
    nna_ram=0
    sdhs_cpu=0
    sdhlxl_cpu=0
    sdhs_ram=0
    sdhlxl_ram=0
    videos_ram=0
  }

  optional_Components_classic_S()
  {
    cpu=18
    ram=96
    root=500
    boot=1
    mnt=50
    swap=`expr $ram / 3`
    vm=VM1
    opts

    echo -e $line
    echo -e "\033[33mChoose one option from:\033[0m"
    echo -e $line
    echo -e "1. WS-RC"
    #echo -e "2. WS-O"
    echo -e "2. WS-S"
    echo -e "3. NNA"
    #echo -e "5. SDH"
    echo -e "4. Videos"
    echo -e $line
    read -a options
    echo -e $line
    for option in "${options[@]}"
    do
    case $option in
      1) echo -e "You have chosen \033[31mWS-RC\033[0m";
        wsrcs_cpu=1;
        wsrclxl_cpu=2;
        wsrcs_ram=8;
        wsrclxl_ram=16;
        ;;
      #2) echo -e "You have chosen \033[31mWS-O\033[0m";
      #  wsos_cpu=1;
      #  wsolxl_cpu=2;
      #  wsos_ram=8;
      #  wsolxl_ram=16;
      #  ;;
      2) echo -e "You have chosen \033[31mWS-S\033[0m";
        wsss_cpu=1;
        wsslxl_cpu=2;
        wsss_ram=8;
        wsslxl_ram=16;
        ;;
      3) echo -e "You have chosen \033[31mNNA\033[0m";
        nna_cpu=4;
        nna_ram=32;
        ;;
      #5) echo -e "You have chosen \033[31mSDH\033[0m";
      #  sdhs_cpu=1;
      #  sdhlxl_cpu=2;
      #  sdhs_ram=8;
      #  sdhlxl_ram=16;
      4) echo -e "You have chosen \033[31mVideos\033[0m";
        videos_ram=6;
        ;;
    esac
    done;



    if [ $wsrcs_cpu != 0 ] || [ $wsos_cpu != 0 ] || [ $wsss_cpu != 0 ]
    then
      cpu=`expr $cpu + 4`;
    fi

    cpu=`expr $cpu + $wsrcs_cpu + $wsos_cpu + $wsss_cpu + $nna_cpu + $sdhs_cpu`

    if [ $wsrcs_ram != 0 ] || [ $wsos_ram != 0 ] || [ $wsss_ram != 0 ]
    then
      ram=`expr $ram + 16`;
    fi

    ram=`expr $ram + $wsrcs_ram + $wsos_ram + $wsss_ram + $nna_ram + $sdhs_ram + $videos_ram`

    swap=`expr $ram / 3`

    
    echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE | column -t -s ":" > /tmp/c_standard_withoptional
    echo -e $vm:$cpu:$ram:$root:$boot:$swap:$mnt | column -t -s ":" >> /tmp/c_standard_withoptional
    echo -e $line
    column -t -s ' ' /tmp/c_standard_withoptional
    echo -e $line
    #cat /tmp/c_standard_withoptional | awk '{print NR-1, $0}' | column -t -s ' '

  }

  optional_Components_classic_L()
  {
    cpu=24
    ram=128
    root=974
    boot=1
    mnt=50
    swap=`expr $ram / 3`
    vm=VM1
    opts

    echo -e $line
    echo -e "\033[33mChoose one option from:\033[0m"
    echo -e $line
    echo -e "1. WS-RC"
    echo -e "2. WS-O"
    echo -e "3. WS-S"
    echo -e "4. NNA"
    echo -e "5. SDH"
    echo -e "6. Videos"
    echo -e $line
    read -a options
    echo -e $line
    for option in "${options[@]}"
    do
    case $option in
      1) echo -e "You have chosen \033[31mWS-RC\033[0m";
        wsrcs_cpu=1;
        wsrclxl_cpu=2;
        wsrcs_ram=8;
        wsrclxl_ram=16;
        ;;
      2) echo -e "You have chosen \033[31mWS-O\033[0m";
        wsos_cpu=1;
        wsolxl_cpu=2;
        wsos_ram=8;
        wsolxl_ram=16;
        ;;
      3) echo -e "You have chosen \033[31mWS-S\033[0m";
        wsss_cpu=1;
        wsslxl_cpu=2;
        wsss_ram=8;
        wsslxl_ram=16;
        ;;
      4) echo -e "You have chosen \033[31mNNA\033[0m";
        nna_cpu=4;
        nna_ram=32;
        ;;
      5) echo -e "You have chosen \033[31mSDH\033[0m";
        sdhs_cpu=1;
        sdhlxl_cpu=2;
        sdhs_ram=8;
        sdhlxl_ram=16;
        ;;
      6) echo -e "You have chosen \033[31mVideos\033[0m";
        videos_ram=6;
        ;;
    esac
    done;

    if [ $wsrclxl_cpu != 0 ] || [ $wsolxl_cpu != 0 ] || [ $wsslxl_cpu != 0 ]
    then
      cpu=`expr $cpu + 4`;
    fi

    cpu=`expr $cpu + $wsrclxl_cpu + $wsolxl_cpu + $wsslxl_cpu + $nna_cpu + $sdhlxl_cpu`

    if [ $wsrclxl_ram != 0 ] || [ $wsolxl_ram != 0 ] || [ $wsslxl_ram != 0 ]
    then
      ram=`expr $ram + 16`;
    fi

    ram=`expr $ram + $wsrclxl_ram + $wsolxl_ram + $wsslxl_ram + $nna_ram + $sdhlxl_ram + $videos_ram`

    swap=`expr $ram / 3`


    echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE | column -t -s ":" > /tmp/c_large_withoptional
    echo -e $vm:$cpu:$ram:$root:$boot:$swap:$mnt | column -t -s ":" >> /tmp/c_large_withoptional
    echo -e $line
    column -t -s ' ' /tmp/c_large_withoptional
    echo -e $line
    #cat /tmp/c_large_withoptional | awk '{print NR-1, $0}' | column -t -s ' '
  }

  optional_Components_classic_XL()
  {
    cpu=32
    ram=192
    root=974
    boot=1
    mnt=50
    swap=`expr $ram / 3`
    vm=VM1
    opts

    echo -e $line
    echo -e "\033[33mChoose one option from:\033[0m"
    echo -e $line
    echo -e "1. WS-RC"
    echo -e "2. WS-O"
    echo -e "3. WS-S"
    echo -e "4. NNA"
    echo -e "5. SDH"
    echo -e "6. Videos"
    echo -e $line
    read -a options
    echo -e $line
    for option in "${options[@]}"
    do
    case $option in
      1) echo -e "You have chosen \033[31mWS-RC\033[0m";
        wsrcs_cpu=1;
        wsrclxl_cpu=2;
        wsrcs_ram=8;
        wsrclxl_ram=16;
        ;;
      2) echo -e "You have chosen \033[31mWS-O\033[0m";
        wsos_cpu=1;
        wsolxl_cpu=2;
        wsos_ram=8;
        wsolxl_ram=16;
        ;;
      3) echo -e "You have chosen \033[31mWS-S\033[0m";
        wsss_cpu=1;
        wsslxl_cpu=2;
        wsss_ram=8;
        wsslxl_ram=16;
        ;;
      4) echo -e "You have chosen \033[31mNNA\033[0m";
        nna_cpu=4;
        nna_ram=32;
        ;;
      5) echo -e "You have chosen \033[31mSDH\033[0m";
        sdhs_cpu=1;
        sdhlxl_cpu=2;
        sdhs_ram=8;
        sdhlxl_ram=16;
        ;;
      6) echo -e "You have chosen \033[31mVideos\033[0m";
        videos_ram=6;
        ;;
    esac
    done;

    if [ $wsrclxl_cpu != 0 ] || [ $wsolxl_cpu != 0 ] || [ $wsslxl_cpu != 0 ]
    then
      cpu=`expr $cpu + 4`;
    fi

    cpu=`expr $cpu + $wsrclxl_cpu + $wsolxl_cpu + $wsslxl_cpu + $nna_cpu + $sdhlxl_cpu`

    if [ $wsrclxl_ram != 0 ] || [ $wsolxl_ram != 0 ] || [ $wsslxl_ram != 0 ]
    then
      ram=`expr $ram + 16`;
    fi

    ram=`expr $ram + $wsrclxl_ram + $wsolxl_ram + $wsslxl_ram + $nna_ram + $sdhlxl_ram + $videos_ram`

    swap=`expr $ram / 3`

    echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE | column -t -s ":" > /tmp/c_xl_withoptional
    echo -e $vm:$cpu:$ram:$root:$boot:$swap:$mnt | column -t -s ":" >> /tmp/c_xl_withoptional
    echo -e $line
    column -t -s ' ' /tmp/c_xl_withoptional
    echo -e $line
    #cat /tmp/c_xl_withoptional | awk '{print NR-1, $0}' | column -t -s ' '

  }


  ##################### Distributed Without Optional ##################################


  d_L_MnCMain_VM1()
  {
    cpu=10
    ram=72
    root=250
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm1="MnCMain"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/d_mncmain_withoutoptional
    echo -e $vm1:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncmain_withoutoptional
    #cat /tmp/d_mncmain_withoutoptional | column -t -s ":"
  }

  d_L_MnCCore_VM2()
  {
    cpu=8
    ram=64
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm2="MnCCore1"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/d_mnccore_withoutoptional
    echo -e $vm2:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mnccore_withoutoptional
    #cat /tmp/d_mnccore_withoutoptional | column -t -s ":"
  }

  d_L_MnCDB_VM3()
  {
    cpu=8
    ram=64
    root=400
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm3="MnCDB"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/d_mncdb_withoutoptional
    echo -e $vm3:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncdb_withoutoptional
    #cat /tmp/d_mncdb_withoutoptional | column -t -s ":"
  }

  d_L_MnCPM_VM4()
  {
    cpu=16
    ram=80
    root=600
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm4="MnCPM"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/d_mncpm_withoutoptional
    echo -e $vm4:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncpm_withoutoptional
    #cat /tmp/d_mncpm_withoutoptional | column -t -s ":"
  }

  d_L_MnCAdapter-A_VM5()
  {
    cpu=6
    ram=48
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm5="MnCAdapter-A"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/d_mncadaptera_withoutoptional
    echo -e $vm5:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncadaptera_withoutoptional
    #cat /tmp/d_mncadaptera_withoutoptional | column -t -s ":"
  }

  d_L_MnCAdapter-B_VM6()
  {
    cpu=6
    ram=48
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm6="MnCAdapter-B"
    echo -e $vm6:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncadapterb_withoptional
  }

  d_L_MnCAdapter-C_VM7()
  {
    cpu=6
    ram=48
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm7="MnCAdapter-C"
    echo -e $vm7:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncadapterc_withoptional
  }

  d_L_MnCAdapter-D_VM8()
  {
    cpu=6
    ram=48
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm8="MnCAdapter-D"
    echo -e $vm8:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncadapterd_withoptional
  }
  d_L_MnCAdapter-E_VM9()
  {
    cpu=6
    ram=48
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm9="MnCAdapter-E"
    echo -e $vm9:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncadaptere_withoptional
  }

  d_L_MnCAdapter-F_VM10()
  {
    cpu=6
    ram=48
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm10="MnCAdapter-F"
    echo -e $vm10:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncadapterf_withoptional
  }

  d_L_MnCOPT_VM11()
  {
    cpu=6
    ram=48
    root=250
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm11="MnCOPT"
    echo -e $vm11:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncopt_withoptional
  }

  d_L_MnCNNA_VM12()
  {
    cpu=4
    ram=32
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm12="MnCNNA"
    echo -e $vm12:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncnna_withoptional
  }

  d_L_MnCHive_VM13()
  {
    cpu=4
    ram=32
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm13="MnCHive"
    echo -e $vm13:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mnchive_withoptional
  }

  d_L_MnCSDH_VM14()
  {
    cpu=4
    ram=32
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm14="MnCSDH"
    echo -e $vm14:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncsdh_withoptional
  }



  d_large_withoutoptional()
  {
    d_L_MnCMain_VM1
    d_L_MnCCore_VM2
    d_L_MnCDB_VM3
    d_L_MnCPM_VM4
    d_L_MnCAdapter-A_VM5

    c_file="/tmp/d_large_withoutoptional"

    echo -e VM_Name:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE | column -t -s ":" > /tmp/d_large_withoutoptional
    cat /tmp/d_mncmain_withoutoptional | column -t -s ":" >> /tmp/d_large_withoutoptional
    cat /tmp/d_mnccore_withoutoptional | column -t -s ":" >> /tmp/d_large_withoutoptional
    cat /tmp/d_mncdb_withoutoptional | column -t -s ":" >> /tmp/d_large_withoutoptional
    cat /tmp/d_mncpm_withoutoptional | column -t -s ":" >> /tmp/d_large_withoutoptional
    cat /tmp/d_mncadaptera_withoutoptional | column -t -s ":" >> /tmp/d_large_withoutoptional
    #column -t -s ' ' /tmp/d_large_withoutoptional
    echo -e $line
    cat /tmp/d_large_withoutoptional | awk '{print NR-1, $0}' | column -t -s ' '
    echo -e $line
    

    read -p "Would you like to create bench.txt:(y/n) " bench;
    if [ "$bench" = "y" ] || [ "$bench" = "yes" ]; then
      echo -e $line;
      read -p "Please give the preferred Directory for bench.txt:(Default is Current Directory) " path1;
      if [ -z "$path1" ]; then
        path1=$(pwd);
      fi;
      rm -rf "$path1"/bench.txt*;
      echo -e $line;
      echo -e "Note: If you want to Configure FQDN separate with ';' (IP;FQDN)";
      echo -e $line;
      timestamp=$(date | awk '{print $4}' | awk -F ":" '{print $1$2$3}');
      for i in $(cat $c_file | column -t -s ' ' | sed '1d' | awk '{print $1}'); do
        read -p "Enter a value for $i: " value1;
        while [ "$value1" = "" ]
        do
          read -p "Enter a value for $i: " value1;
        done;
        echo -e "$i=$value1" >> "$path1/bench.txt_$timestamp";
      done;
    mv $path1/bench.txt* $path1/bench.txt;
    echo -e $line;
    echo -e "Your bench file is here: $path1/bench.txt";
    fi 
    
    echo -e $line
    read -p "Would you like to create bench.txt for HA:(y/n) " HAbench;
    if [ "$HAbench" = "y" ] || [ "$HAbench" = "yes" ]; then
      echo -e $line;
      read -p "Please give the preferred Directory for bench.txt:(Default is Current Directory) " path2;
      if [ -z "$path2" ]; then
        path2=$(pwd);
      fi;
      rm -rf "$path2"/HAbench.txt*;
      echo -e $line;
      echo -e "Note: If you want to Configure FQDN separate with ';' (IP;FQDN)";
      echo -e $line;
      timestamp=$(date | awk '{print $4}' | awk -F ":" '{print $1$2$3}');
      for i in $(cat $c_file | column -t -s ' ' | sed '1d' | awk '{print "HA"$1}'); do
        read -p "Enter a value for $i: " value2;
        while [ "$value2" = "" ]
        do
          read -p "Enter a value for $i: " value2;
        done;
        echo -e "$i=$value2" >> "$path2/HAbench.txt_$timestamp";
      done;
    mv $path2/HAbench.txt* $path2/HAbench.txt;
    echo -e $line;
    echo -e "Your HAbench file is here: $path2/HAbench.txt";
    fi
    
    if [ "$bench" = "y" ] || [ "$bench" = "yes" ] && [ "$HAbench" = "y" ] || [ "$HAbench" = "yes" ]; then
    echo -e $line;
    read -p "Would you like to Combine both files:(y/n) " choice;
    if [ "$choice" = "y" ] || [ "$choice" = "yes" ]; then
      cat $path1/bench.txt $path2/HAbench.txt > $path1/bench1.txt;
      echo -e $line;
      echo -e "Your Combined file is here: $path1/bench1.txt";
      echo -e $line;
    fi
    fi  



  }

  d_XL_MnCMain_VM1()
  {
    cpu=12
    ram=87
    root=300
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm1="MnCMain"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/d_mncmain_withoutoptional
    echo -e $vm1:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncmain_withoutoptional
    #cat /tmp/d_mncmain_withoutoptional | column -t -s ":"
  }

  d_XL_MnCCore_VM2()
  {
    cpu=10
    ram=77
    root=420
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm2="MnCCore1"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/d_mnccore_withoutoptional
    echo -e $vm2:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mnccore_withoutoptional
    #cat /tmp/d_mnccore_withoutoptional | column -t -s ":"
  }

  d_XL_MnCDB_VM3()
  {
    cpu=10
    ram=77
    root=480
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm3="MnCDB"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/d_mncdb_withoutoptional
    echo -e $vm3:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncdb_withoutoptional
    #cat /tmp/d_mncdb_withoutoptional | column -t -s ":"
  }

  d_XL_MnCPM_VM4()
  {
    cpu=20
    ram=96
    root=720
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm4="MnCPM"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/d_mncpm_withoutoptional
    echo -e $vm4:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncpm_withoutoptional
    #cat /tmp/d_mncpm_withoutoptional | column -t -s ":"
  }

  d_XL_MnCAdapter-A_VM5()
  {
    cpu=8
    ram=58
    root=420
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm5="MnCAdapter-A"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/d_mncadaptera_withoutoptional
    echo -e $vm5:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncadaptera_withoutoptional
    #cat /tmp/d_mncadaptera_withoutoptional | column -t -s ":"
  }

    d_XL_MnCAdapter-B_VM6()
  {
    cpu=8
    ram=58
    root=420
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm6="MnCAdapter-B"
    echo -e $vm6:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncadapterb_withoptional
  }

  d_XL_MnCAdapter-C_VM7()
  {
    cpu=8
    ram=58
    root=420
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm7="MnCAdapter-C"
    echo -e $vm7:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncadapterc_withoptional
  }

  d_XL_MnCAdapter-D_VM8()
  {
    cpu=8
    ram=58
    root=420
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm8="MnCAdapter-D"
    echo -e $vm8:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncadapterd_withoptional
  }
  d_XL_MnCAdapter-E_VM9()
  {
    cpu=8
    ram=58
    root=420
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm9="MnCAdapter-E"
    echo -e $vm9:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncadaptere_withoptional
  }

  d_XL_MnCAdapter-F_VM10()
  {
    cpu=8
    ram=58
    root=420
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm10="MnCAdapter-F"
    echo -e $vm10:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncadapterf_withoptional
  }

  d_XL_MnCOPT_VM11()
  {
    cpu=8
    ram=58
    root=300
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm11="MnCOPT"
    echo -e $vm11:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncopt_withoptional
  }

  d_XL_MnCNNA_VM12()
  {
    cpu=4
    ram=32
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm12="MnCNNA"
    echo -e $vm12:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncnna_withoptional
  }

  d_XL_MnCHive_VM13()
  {
    cpu=4
    ram=32
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm13="MnCHive"
    echo -e $vm13:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mnchive_withoptional
  }

  d_XL_MnCSDH_VM14()
  {
    cpu=4
    ram=32
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm14="MnCSDH"
    echo -e $vm14:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncsdh_withoptional
  }

  d_xl_withoutoptional()
  {
    d_XL_MnCMain_VM1
    d_XL_MnCCore_VM2
    d_XL_MnCDB_VM3
    d_XL_MnCPM_VM4
    d_XL_MnCAdapter-A_VM5

    c_file="/tmp/d_xl_withoutoptional"

    echo -e VM_Name:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE | column -t -s ":" > /tmp/d_xl_withoutoptional
    cat /tmp/d_mncmain_withoutoptional | column -t -s ":" >> /tmp/d_xl_withoutoptional
    cat /tmp/d_mnccore_withoutoptional | column -t -s ":" >> /tmp/d_xl_withoutoptional
    cat /tmp/d_mncdb_withoutoptional | column -t -s ":" >> /tmp/d_xl_withoutoptional
    cat /tmp/d_mncpm_withoutoptional | column -t -s ":" >> /tmp/d_xl_withoutoptional
    cat /tmp/d_mncadaptera_withoutoptional | column -t -s ":" >> /tmp/d_xl_withoutoptional
    #column -t -s ' ' /tmp/d_xl_withoutoptional
    cat /tmp/d_xl_withoutoptional | awk '{print NR-1, $0}' | column -t -s ' '

    echo -e $line;
    read -p "Would you like to create bench.txt:(y/n) " bench;
    if [ "$bench" = "y" ] || [ "$bench" = "yes" ]; then
      echo -e $line;
      read -p "Please give the preferred Directory for bench.txt:(Default is Current Directory) " path1;
      if [ -z "$path1" ]; then
        path1=$(pwd);
      fi;
      rm -rf "$path1"/bench.txt*;
      echo -e $line;
      echo -e "Note: If you want to Configure FQDN separate with ';' (IP;FQDN)";
      echo -e $line;
      timestamp=$(date | awk '{print $4}' | awk -F ":" '{print $1$2$3}');
      for i in $(cat $c_file | column -t -s ' ' | sed '1d' | awk '{print $1}'); do
        read -p "Enter a value for $i: " value1;
        while [ "$value1" = "" ]
        do
          read -p "Enter a value for $i: " value1;
        done;
        echo -e "$i=$value1" >> "$path1/bench.txt_$timestamp";
      done;
    mv $path1/bench.txt* $path1/bench.txt;
    echo -e $line;
    echo -e "Your bench file is here: $path1/bench.txt";
    fi 
    
    echo -e $line;
    read -p "Would you like to create bench.txt for HA:(y/n) " HAbench;
    if [ "$HAbench" = "y" ] || [ "$HAbench" = "yes" ]; then
      echo -e $line;
      read -p "Please give the preferred Directory for bench.txt:(Default is Current Directory) " path2;
      if [ -z "$path2" ]; then
        path2=$(pwd);
      fi;
      rm -rf "$path2"/HAbench.txt*;
      echo -e $line;
      echo -e "Note: If you want to Configure FQDN separate with ';' (IP;FQDN)";
      echo -e $line;
      timestamp=$(date | awk '{print $4}' | awk -F ":" '{print $1$2$3}');
      for i in $(cat $c_file | column -t -s ' ' | sed '1d' | awk '{print "HA"$1}'); do
        read -p "Enter a value for $i: " value2;
        while [ "$value2" = "" ]
        do
          read -p "Enter a value for $i: " value2;
        done;
        echo -e "$i=$value2" >> "$path2/HAbench.txt_$timestamp";
      done;
    mv $path2/HAbench.txt* $path2/HAbench.txt;
    echo -e $line;
    echo -e "Your HAbench file is here: $path2/HAbench.txt";
    fi
    
    if [ "$bench" = "y" ] || [ "$bench" = "yes" ] && [ "$HAbench" = "y" ] || [ "$HAbench" = "yes" ]; then
    echo -e $line;
    read -p "Would you like to Combine both files:(y/n) " choice;
    if [ "$choice" = "y" ] || [ "$choice" = "yes" ]; then
      cat $path1/bench.txt $path2/HAbench.txt > $path1/bench1.txt;
      echo -e $line;
      echo -e "Your Combined file is here: $path1/bench1.txt";
      echo -e $line;
    fi
    fi  

  }



#####################################################################################

############################ Distributed with optional #####################################

opts_distributed()
{
opt_cpu_db_l=0;
opt_cpu_db_xl=0;
opt_ram_db_l=0;
opt_ram_db_xl=0;
nna_cpu_mc_l=0;
nna_cpu_mc_xl=0;
nna_cpu_db_l=0;
nna_cpu_db_xl=0;
nna_ram_mc_l=0;
nna_ram_mc_xl=0;
nna_ram_db_l=0;
nna_ram_db_xl=0;
nna_root_c_l=0;
nna_root_c_xl=0;
nna_root_db_l=0;
nna_root_db_xl=0;
adb_cpu_mc_l=0;
adb_cpu_dbpm_l=0;
adb_ram_mcpm_l=0;
adb_ram_db_l=0;
adb_root_c_l=0;
adb_root_db_l=0;
adb_root_pm_l=0;
adb_cpu_mc_xl=0;
adb_cpu_dbpm_xl=0;
adb_ram_mcpm_xl=0;
adb_ram_db_xl=0;
adb_root_c_xl=0;
adb_root_db_xl=0;
adb_root_pm_xl=0; 
adc_cpu_mc_l=0;
adc_cpu_dbpm_l=0;
adc_ram_mcpm_l=0;
adc_ram_db_l=0;
adc_root_c_l=0;
adc_root_db_l=0;
adc_root_pm_l=0;
adc_cpu_mc_xl=0;
adc_cpu_dbpm_xl=0;
adc_ram_mcpm_xl=0;
adc_ram_db_xl=0;
adc_root_c_xl=0;
adc_root_db_xl=0;
adc_root_pm_xl=0;
add_cpu_mc_l=0;
add_cpu_dbpm_l=0;
add_ram_mcpm_l=0;
add_ram_db_l=0;
add_root_c_l=0;
add_root_db_l=0;
add_root_pm_l=0;
add_cpu_mc_xl=0;
add_cpu_dbpm_xl=0;
add_ram_mcpm_xl=0;
add_ram_db_xl=0;
add_root_c_xl=0;
add_root_db_xl=0;
add_root_pm_xl=0;
ade_cpu_mc_l=0;
ade_cpu_dbpm_l=0;
ade_ram_mcpm_l=0;
ade_ram_db_l=0;
ade_root_c_l=0;
ade_root_db_l=0;
ade_root_pm_l=0;
ade_cpu_mc_xl=0;
ade_cpu_dbpm_xl=0;
ade_ram_mcpm_xl=0;
ade_ram_db_xl=0;
ade_root_c_xl=0;
ade_root_db_xl=0;
ade_root_pm_xl=0;  
adf_cpu_mc_l=0;
adf_cpu_dbpm_l=0;
adf_ram_mcpm_l=0;
adf_ram_db_l=0;
adf_root_c_l=0;
adf_root_db_l=0;
adf_root_pm_l=0;
adf_cpu_mc_xl=0;
adf_cpu_dbpm_xl=0;
adf_ram_mcpm_xl=0;
adf_ram_db_xl=0;
adf_root_c_xl=0;
adf_root_db_xl=0;
adf_root_pm_xl=0;
videos_ram_m=0;
sdh_c=0;
hive_c=0;
}

optional_Components1L()
  {

    opts_distributed

    echo -e $line
    echo -e "\033[33mChoose one option from:\033[0m"
    echo -e $line
    echo -e "1. (WSS,WSO,WS-RC)"
    echo -e "2. NNA"
    echo -e "3. Hive"
    #echo -e "4. SDH"
    echo -e "4. Adapter-B"
    echo -e "5. Adapter-C"
    echo -e "6. Adapter-D"
    echo -e "7. Adapter-E"
    echo -e "8. Adapter-F"
    echo -e "9. Videos"
    echo -e $line
    read -a options
    echo -e $line
    for option in "${options[@]}"
    do
    case $option in
      1) echo -e "You have chosen \033[31mOPT(WSS,WSO,WS-RC)\033[0m";
          d_L_MnCOPT_VM11;
          opt_cpu_db_l=4;
          opt_cpu_db_xl=5;
          opt_ram_db_l=24;
          opt_ram_db_xl=29;;
      2) echo -e "You have chosen \033[31mNNA\033[0m";
          d_L_MnCNNA_VM12;
          nna_cpu_mc_l=1;
          nna_cpu_mc_xl=2;
          nna_cpu_db_l=2;
          nna_cpu_db_xl=3;
          nna_ram_mc_l=8;
          nna_ram_mc_xl=10;
          nna_ram_db_l=16;
          nna_ram_db_xl=20;
          nna_root_c_l=50;
          nna_root_c_xl=60;
          nna_root_db_l=100;
          nna_root_db_xl=120;;
      3) echo -e "You have chosen \033[31mHive\033[0m";
          d_L_MnCHive_VM13;
          hive_c=1;;
      #4) echo -e "You have chosen SDH";
      #    d_L_MnCSDH_VM14;
      #    sdh_c=1;;
      4) echo -e "You have chosen \033[31mAdapter-B\033[0m";
          d_L_MnCAdapter-B_VM6;
          adb_cpu_mc_l=1;
          adb_cpu_dbpm_l=2;
          adb_ram_mcpm_l=8;
          adb_ram_db_l=16;
          adb_root_c_l=50;
          adb_root_db_l=100;
          adb_root_pm_l=250;
          adb_cpu_mc_xl=2;
          adb_cpu_dbpm_xl=3;
          adb_ram_mcpm_xl=10;
          adb_ram_db_xl=20;
          adb_root_c_xl=60;
          adb_root_db_xl=120;
          adb_root_pm_xl=300;;
      5) echo -e "You have chosen \033[31mAdapter-C\033[0m";
          d_L_MnCAdapter-C_VM7;
          adc_cpu_mc_l=1;
          adc_cpu_dbpm_l=2;
          adc_ram_mcpm_l=8;
          adc_ram_db_l=16;
          adc_root_c_l=50;
          adc_root_db_l=100;
          adc_root_pm_l=250;
          adc_cpu_mc_xl=2;
          adc_cpu_dbpm_xl=3;
          adc_ram_mcpm_xl=10;
          adc_ram_db_xl=20;
          adc_root_c_xl=60;
          adc_root_db_xl=120;
          adc_root_pm_xl=300;;
      6) echo -e "You have chosen \033[31mAdapter-D\033[0m";
          d_L_MnCAdapter-D_VM8;
          add_cpu_mc_l=1;
          add_cpu_dbpm_l=2;
          add_ram_mcpm_l=8;
          add_ram_db_l=16;
          add_root_c_l=50;
          add_root_db_l=100;
          add_root_pm_l=250;
          add_cpu_mc_xl=2;
          add_cpu_dbpm_xl=3;
          add_ram_mcpm_xl=10;
          add_ram_db_xl=20;
          add_root_c_xl=60;
          add_root_db_xl=120;
          add_root_pm_xl=300;;
      7) echo -e "You have chosen \033[31mAdapter-E\033[0m";
          d_L_MnCAdapter-E_VM9;
          ade_cpu_mc_l=1;
          ade_cpu_dbpm_l=2;
          ade_ram_mcpm_l=8;
          ade_ram_db_l=16;
          ade_root_c_l=50;
          ade_root_db_l=100;
          ade_root_pm_l=250;
          ade_cpu_mc_xl=2;
          ade_cpu_dbpm_xl=3;
          ade_ram_mcpm_xl=10;
          ade_ram_db_xl=20;
          ade_root_c_xl=60;
          ade_root_db_xl=120;
          ade_root_pm_xl=300;;
      8) echo -e "You have chosen \033[31mAdapter-F\033[0m";
          d_L_MnCAdapter-F_VM10;
          adf_cpu_mc_l=1;
          adf_cpu_dbpm_l=2;
          adf_ram_mcpm_l=8;
          adf_ram_db_l=16;
          adf_root_c_l=50;
          adf_root_db_l=100;
          adf_root_pm_l=250;
          adf_cpu_mc_xl=2;
          adf_cpu_dbpm_xl=3;
          adf_ram_mcpm_xl=10;
          adf_ram_db_xl=20;
          adf_root_c_xl=60;
          adf_root_db_xl=120;
          adf_root_pm_xl=300;;
      9) echo -e "You have chosen \033[31mVideos\033[0m";
          videos_ram_m=6;;
    esac
    done

    d_L_MnCMain_VM1_w()
    {
      d_L_MnCMain_VM1
      
      cpu=`expr $cpu + $nna_cpu_mc_l + $adb_cpu_mc_l + $adc_cpu_mc_l + $add_cpu_mc_l + $ade_cpu_mc_l + $adf_cpu_mc_l`
      
      ram=`expr $ram + $nna_ram_mc_l + $adb_ram_mcpm_l + $adc_ram_mcpm_l + $add_ram_mcpm_l + $ade_ram_mcpm_l + $adf_ram_mcpm_l + $videos_ram_m`
      
      swap=`expr $ram / 3`
      
      echo -e $vm1:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncmain_withoptional                      

    }

    d_L_MnCCore_VM2_w()
    {
      d_L_MnCCore_VM2

      cpu=`expr $cpu + $nna_cpu_mc_l + $adb_cpu_mc_l + $adc_cpu_mc_l + $add_cpu_mc_l + $ade_cpu_mc_l + $adf_cpu_mc_l`

      ram=`expr $ram + $nna_ram_mc_l + $adb_ram_mcpm_l + $adc_ram_mcpm_l + $add_ram_mcpm_l + $ade_ram_mcpm_l + $adf_ram_mcpm_l`

      swap=`expr $ram / 3`

      root=`expr $root + $nna_root_c_l + $adb_root_c_l + $adc_root_c_l + $add_root_c_l + $ade_root_c_l + $adf_root_c_l`
      
      echo -e $vm2:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mnccore_withoptional
    }

    d_L_MnCDB_VM3_w()
    {
      d_L_MnCDB_VM3

      cpu=`expr $cpu + $opt_cpu_db_l + $nna_cpu_db_l + $adb_cpu_dbpm_l + $adc_cpu_dbpm_l + $add_cpu_dbpm_l + $ade_cpu_dbpm_l + $adf_cpu_dbpm_l`

      ram=`expr $ram + $opt_ram_db_l + $nna_ram_db_l + $adb_ram_db_l + $adc_ram_db_l + $add_ram_db_l + $ade_ram_db_l + $adf_ram_db_l`

      swap=`expr $ram / 3`

      root=`expr $root + $nna_root_db_l + $adb_root_db_l + $adc_root_db_l + $add_root_db_l + $ade_root_db_l + $adf_root_db_l`

      echo -e $vm3:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncdb_withoptional
    }

    d_L_MnCPM_VM4_w()
    {
      d_L_MnCPM_VM4

      cpu=`expr $cpu + $adb_cpu_dbpm_l + $adc_cpu_dbpm_l + $add_cpu_dbpm_l + $ade_cpu_dbpm_l + $adf_cpu_dbpm_l`

      ram=`expr $ram + $adb_ram_mcpm_l + $adc_ram_mcpm_l + $add_ram_mcpm_l + $ade_ram_mcpm_l + $adf_ram_mcpm_l`

      swap=`expr $ram / 3`

      root=`expr $root + $adb_root_pm_l + $adc_root_pm_l + $add_root_pm_l + $ade_root_pm_l + $adf_root_pm_l`

      echo -e $vm4:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncpm_withoptional
                      
    }

    d_L_MnCAdapter-A_VM5_w()
    {
      d_L_MnCAdapter-A_VM5

      echo -e $vm5:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncadaptera_withoptional
    }

    d_L_MnCMain_VM1_w
    d_L_MnCCore_VM2_w
    d_L_MnCDB_VM3_w
    d_L_MnCPM_VM4_w
    d_L_MnCAdapter-A_VM5_w

    c_file="/tmp/d_large_withoptional"

    echo -e VM_Name:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE | column -t -s ":" > /tmp/d_large_withoptional
    cat /tmp/d_mncmain_withoptional | column -t -s ":" >> /tmp/d_large_withoptional
    cat /tmp/d_mnccore_withoptional | column -t -s ":" >> /tmp/d_large_withoptional
    cat /tmp/d_mncdb_withoptional | column -t -s ":" >> /tmp/d_large_withoptional
    cat /tmp/d_mncpm_withoptional | column -t -s ":" >> /tmp/d_large_withoptional
    cat /tmp/d_mncadaptera_withoptional | column -t -s ":" >> /tmp/d_large_withoptional

    if [ $adb_cpu_mc_l != 0 ]
    then
    cat /tmp/d_mncadapterb_withoptional | column -t -s ":" >> /tmp/d_large_withoptional;
    fi

    if [ $adc_cpu_mc_l != 0 ]
    then
    cat /tmp/d_mncadapterc_withoptional | column -t -s ":" >> /tmp/d_large_withoptional;
    fi

    if [ $add_cpu_mc_l != 0 ]
    then
    cat /tmp/d_mncadapterd_withoptional | column -t -s ":" >> /tmp/d_large_withoptional;
    fi

    if [ $ade_cpu_mc_l != 0 ]
    then
    cat /tmp/d_mncadaptere_withoptional | column -t -s ":" >> /tmp/d_large_withoptional;
    fi

    if [ $adf_cpu_mc_l != 0 ]
    then
    cat /tmp/d_mncadapterf_withoptional | column -t -s ":" >> /tmp/d_large_withoptional;
    fi

    if [ $opt_cpu_db_l != 0 ]
    then
    cat /tmp/d_mncopt_withoptional | column -t -s ":" >> /tmp/d_large_withoptional;
    fi

    if [ $nna_cpu_mc_l != 0 ]
    then
    cat /tmp/d_mncnna_withoptional | column -t -s ":" >> /tmp/d_large_withoptional;
    fi 

    if [ $hive_c != 0 ]
    then
    cat /tmp/d_mnchive_withoptional | column -t -s ":" >> /tmp/d_large_withoptional;
    fi

    if [ $sdh_c != 0 ]
    then
    cat /tmp/d_mncsdh_withoptional | column -t -s ":" >> /tmp/d_large_withoptional;
    fi

    #column -t -s ' ' /tmp/d_large_withoptional
    cat /tmp/d_large_withoptional | awk '{print NR-1, $0}' | column -t -s ' '

    echo -e $line;
       read -p "Would you like to create bench.txt:(y/n) " bench;
    if [ "$bench" = "y" ] || [ "$bench" = "yes" ]; then
      echo -e $line;
      read -p "Please give the preferred Directory for bench.txt:(Default is Current Directory) " path1;
      if [ -z "$path1" ]; then
        path1=$(pwd);
      fi;
      rm -rf "$path1"/bench.txt*;
      echo -e $line;
      echo -e "Note: If you want to Configure FQDN separate with ';' (IP;FQDN)";
      echo -e $line;
      timestamp=$(date | awk '{print $4}' | awk -F ":" '{print $1$2$3}');
      for i in $(cat $c_file | column -t -s ' ' | sed '1d' | awk '{print $1}'); do
        read -p "Enter a value for $i: " value1;
        while [ "$value1" = "" ]
        do
          read -p "Enter a value for $i: " value1;
        done;
        echo -e "$i=$value1" >> "$path1/bench.txt_$timestamp";
      done;
    mv $path1/bench.txt* $path1/bench.txt;
    echo -e $line;
    echo -e "Your bench file is here: $path1/bench.txt";
    fi 
    
    echo -e $line;
    read -p "Would you like to create bench.txt for HA:(y/n) " HAbench;
    if [ "$HAbench" = "y" ] || [ "$HAbench" = "yes" ]; then
      echo -e $line;
      read -p "Please give the preferred Directory for bench.txt:(Default is Current Directory) " path2;
      if [ -z "$path2" ]; then
        path2=$(pwd);
      fi;
      rm -rf "$path2"/HAbench.txt*;
      echo -e $line;
      echo -e "Note: If you want to Configure FQDN separate with ';' (IP;FQDN)";
      echo -e $line;
      timestamp=$(date | awk '{print $4}' | awk -F ":" '{print $1$2$3}');
      for i in $(cat $c_file | column -t -s ' ' | sed '1d' | awk '{print "HA"$1}'); do
        read -p "Enter a value for $i: " value2;
        while [ "$value2" = "" ]
        do
          read -p "Enter a value for $i: " value2;
        done;
        echo -e "$i=$value2" >> "$path2/HAbench.txt_$timestamp";
      done;
    mv $path2/HAbench.txt* $path2/HAbench.txt;
    echo -e $line;
    echo -e "Your HAbench file is here: $path2/HAbench.txt";
    fi
    
    if [ "$bench" = "y" ] || [ "$bench" = "yes" ] && [ "$HAbench" = "y" ] || [ "$HAbench" = "yes" ]; then
    echo -e $line;
    read -p "Would you like to Combine both files:(y/n) " choice;
    if [ "$choice" = "y" ] || [ "$choice" = "yes" ]; then
      cat $path1/bench.txt $path2/HAbench.txt > $path1/bench1.txt;
      echo -e $line;
      echo -e "Your Combined file is here: $path1/bench1.txt";
      echo -e $line;
    fi
    fi  

    
  }

  optional_Components1XL()
  {

    opts_distributed

    echo -e $line
    echo -e "\033[33mChoose one option from:\033[0m"
    echo -e $line
    echo -e "1. (WSS,WSO,WS-RC)"
    echo -e "2. NNA"
    echo -e "3. Hive"
    echo -e "4. SDH"
    echo -e "4. Adapter-B"
    echo -e "5. Adapter-C"
    echo -e "6. Adapter-D"
    echo -e "7. Adapter-E"
    echo -e "8. Adapter-F"
    echo -e "9. Videos"
    echo -e $line
    read -a options
    echo -e $line
    for option in "${options[@]}"
    do
    case $option in
      1) echo -e "You have chosen \033[31mOPT(WSS,WSO,WS-RC)\033[0m";
          d_XL_MnCOPT_VM11;
          opt_cpu_db_l=4;
          opt_cpu_db_xl=5;
          opt_ram_db_l=24;
          opt_ram_db_xl=29;;
      2) echo -e "You have chosen \033[31mNNA\033[0m";
          d_XL_MnCNNA_VM12;
          nna_cpu_mc_l=1;
          nna_cpu_mc_xl=2;
          nna_cpu_db_l=2;
          nna_cpu_db_xl=3;
          nna_ram_mc_l=8;
          nna_ram_mc_xl=10;
          nna_ram_db_l=16;
          nna_ram_db_xl=20;
          nna_root_c_l=50;
          nna_root_c_xl=60;
          nna_root_db_l=100;
          nna_root_db_xl=120;;
      3) echo -e "You have chosen \033[31mHive\033[0m";
          d_XL_MnCHive_VM13;
          hive_c=1;;
      #4) echo -e "You have chosen SDH";
      #    d_XL_MnCSDH_VM14;
      #    sdh_c=1;;
      4) echo -e "You have chosen \033[31mAdapter-B\033[0m";
          d_XL_MnCAdapter-B_VM6;
          adb_cpu_mc_l=1;
          adb_cpu_dbpm_l=2;
          adb_ram_mcpm_l=8;
          adb_ram_db_l=16;
          adb_root_c_l=50;
          adb_root_db_l=100;
          adb_root_pm_l=250;
          adb_cpu_mc_xl=2;
          adb_cpu_dbpm_xl=3;
          adb_ram_mcpm_xl=10;
          adb_ram_db_xl=20;
          adb_root_c_xl=60;
          adb_root_db_xl=120;
          adb_root_pm_xl=300;;
      5) echo -e "You have chosen \033[31mAdapter-C\033[0m";
          d_XL_MnCAdapter-C_VM7;
          adc_cpu_mc_l=1;
          adc_cpu_dbpm_l=2;
          adc_ram_mcpm_l=8;
          adc_ram_db_l=16;
          adc_root_c_l=50;
          adc_root_db_l=100;
          adc_root_pm_l=250;
          adc_cpu_mc_xl=2;
          adc_cpu_dbpm_xl=3;
          adc_ram_mcpm_xl=10;
          adc_ram_db_xl=20;
          adc_root_c_xl=60;
          adc_root_db_xl=120;
          adc_root_pm_xl=300;;
      6) echo -e "You have chosen \033[31mAdapter-D\033[0m";
          d_XL_MnCAdapter-D_VM8;
          add_cpu_mc_l=1;
          add_cpu_dbpm_l=2;
          add_ram_mcpm_l=8;
          add_ram_db_l=16;
          add_root_c_l=50;
          add_root_db_l=100;
          add_root_pm_l=250;
          add_cpu_mc_xl=2;
          add_cpu_dbpm_xl=3;
          add_ram_mcpm_xl=10;
          add_ram_db_xl=20;
          add_root_c_xl=60;
          add_root_db_xl=120;
          add_root_pm_xl=300;;
      7) echo -e "You have chosen \033[31mAdapter-E\033[0m";
          d_XL_MnCAdapter-E_VM9;
          ade_cpu_mc_l=1;
          ade_cpu_dbpm_l=2;
          ade_ram_mcpm_l=8;
          ade_ram_db_l=16;
          ade_root_c_l=50;
          ade_root_db_l=100;
          ade_root_pm_l=250;
          ade_cpu_mc_xl=2;
          ade_cpu_dbpm_xl=3;
          ade_ram_mcpm_xl=10;
          ade_ram_db_xl=20;
          ade_root_c_xl=60;
          ade_root_db_xl=120;
          ade_root_pm_xl=300;;
      8) echo -e "You have chosen \033[31mAdapter-F\033[0m";
          d_XL_MnCAdapter-F_VM10;
          adf_cpu_mc_l=1;
          adf_cpu_dbpm_l=2;
          adf_ram_mcpm_l=8;
          adf_ram_db_l=16;
          adf_root_c_l=50;
          adf_root_db_l=100;
          adf_root_pm_l=250;
          adf_cpu_mc_xl=2;
          adf_cpu_dbpm_xl=3;
          adf_ram_mcpm_xl=10;
          adf_ram_db_xl=20;
          adf_root_c_xl=60;
          adf_root_db_xl=120;
          adf_root_pm_xl=300;;
      9) echo -e "You have chosen \033[31mVideos\033[0m";
          videos_ram_m=6;;
    esac
    done

    d_XL_MnCMain_VM1_w()
    {
      d_XL_MnCMain_VM1
      
      cpu=`expr $cpu + $nna_cpu_mc_xl + $adb_cpu_mc_xl + $adc_cpu_mc_xl + $add_cpu_mc_xl + $ade_cpu_mc_xl + $adf_cpu_mc_xl`
      
      ram=`expr $ram + $nna_ram_mc_xl + $adb_ram_mcpm_xl + $adc_ram_mcpm_xl + $add_ram_mcpm_xl + $ade_ram_mcpm_xl + $adf_ram_mcpm_xl + $videos_ram_m`
      
      swap=`expr $ram / 3`
      
      echo -e $vm1:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncmain_withoptional                      

    }

    d_XL_MnCCore_VM2_w()
    {
      d_XL_MnCCore_VM2

      cpu=`expr $cpu + $nna_cpu_mc_xl + $adb_cpu_mc_xl + $adc_cpu_mc_xl + $add_cpu_mc_xl + $ade_cpu_mc_xl + $adf_cpu_mc_xl`

      ram=`expr $ram + $nna_ram_mc_xl + $adb_ram_mcpm_xl + $adc_ram_mcpm_xl + $add_ram_mcpm_xl + $ade_ram_mcpm_xl + $adf_ram_mcpm_xl`

      swap=`expr $ram / 3`

      root=`expr $root + $nna_root_c_xl + $adb_root_c_xl + $adc_root_c_xl + $add_root_c_xl + $ade_root_c_xl + $adf_root_c_xl`
      
      echo -e $vm2:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mnccore_withoptional
    }

    d_XL_MnCDB_VM3_w()
    {
      d_XL_MnCDB_VM3

      cpu=`expr $cpu + $opt_cpu_db_xl + $nna_cpu_db_xl + $adb_cpu_dbpm_xl + $adc_cpu_dbpm_xl + $add_cpu_dbpm_xl + $ade_cpu_dbpm_xl + $adf_cpu_dbpm_xl`

      ram=`expr $ram + $opt_ram_db_xl + $nna_ram_db_xl + $adb_ram_db_xl + $adc_ram_db_xl + $add_ram_db_xl + $ade_ram_db_xl + $adf_ram_db_xl`

      swap=`expr $ram / 3`

      root=`expr $root + $nna_root_db_xl + $adb_root_db_xl + $adc_root_db_xl + $add_root_db_xl + $ade_root_db_xl + $adf_root_db_xl`

      echo -e $vm3:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncdb_withoptional
    }

    d_XL_MnCPM_VM4_w()
    {
      d_XL_MnCPM_VM4

      cpu=`expr $cpu + $adb_cpu_dbpm_xl + $adc_cpu_dbpm_xl + $add_cpu_dbpm_xl + $ade_cpu_dbpm_xl + $adf_cpu_dbpm_xl`

      ram=`expr $ram + $adb_ram_mcpm_xl + $adc_ram_mcpm_xl + $add_ram_mcpm_xl + $ade_ram_mcpm_xl + $adf_ram_mcpm_xl`

      swap=`expr $ram / 3`

      root=`expr $root + $adb_root_pm_xl + $adc_root_pm_xl + $add_root_pm_xl + $ade_root_pm_xl + $adf_root_pm_xl`

      echo -e $vm4:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncpm_withoptional
                      
    }

    d_XL_MnCAdapter-A_VM5_w()
    {
      d_XL_MnCAdapter-A_VM5

      echo -e $vm5:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/d_mncadaptera_withoptional
    }

    d_XL_MnCMain_VM1_w
    d_XL_MnCCore_VM2_w
    d_XL_MnCDB_VM3_w
    d_XL_MnCPM_VM4_w
    d_XL_MnCAdapter-A_VM5_w

    c_file="/tmp/d_xlarge_withoptional"

    echo -e VM_Name:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE | column -t -s ":" > /tmp/d_xlarge_withoptional
    cat /tmp/d_mncmain_withoptional | column -t -s ":" >> /tmp/d_xlarge_withoptional
    cat /tmp/d_mnccore_withoptional | column -t -s ":" >> /tmp/d_xlarge_withoptional
    cat /tmp/d_mncdb_withoptional | column -t -s ":" >> /tmp/d_xlarge_withoptional
    cat /tmp/d_mncpm_withoptional | column -t -s ":" >> /tmp/d_xlarge_withoptional
    cat /tmp/d_mncadaptera_withoptional | column -t -s ":" >> /tmp/d_xlarge_withoptional

    if [ $adb_cpu_mc_xl != 0 ]
    then
    cat /tmp/d_mncadapterb_withoptional | column -t -s ":" >> /tmp/d_xlarge_withoptional;
    fi

    if [ $adc_cpu_mc_xl != 0 ]
    then
    cat /tmp/d_mncadapterc_withoptional | column -t -s ":" >> /tmp/d_xlarge_withoptional;
    fi

    if [ $add_cpu_mc_xl != 0 ]
    then
    cat /tmp/d_mncadapterd_withoptional | column -t -s ":" >> /tmp/d_xlarge_withoptional;
    fi

    if [ $ade_cpu_mc_xl != 0 ]
    then
    cat /tmp/d_mncadaptere_withoptional | column -t -s ":" >> /tmp/d_xlarge_withoptional;
    fi

    if [ $adf_cpu_mc_xl != 0 ]
    then
    cat /tmp/d_mncadapterf_withoptional | column -t -s ":" >> /tmp/d_xlarge_withoptional;
    fi

    if [ $opt_cpu_db_xl != 0 ]
    then
    cat /tmp/d_mncopt_withoptional | column -t -s ":" >> /tmp/d_xlarge_withoptional;
    fi

    if [ $nna_cpu_mc_xl != 0 ]
    then
    cat /tmp/d_mncnna_withoptional | column -t -s ":" >> /tmp/d_xlarge_withoptional;
    fi 

    if [ $hive_c != 0 ]
    then
    cat /tmp/d_mnchive_withoptional | column -t -s ":" >> /tmp/d_xlarge_withoptional;
    fi

    if [ $sdh_c != 0 ]
    then
    cat /tmp/d_mncsdh_withoptional | column -t -s ":" >> /tmp/d_xlarge_withoptional;
    fi

    #column -t -s ' ' /tmp/d_xlarge_withoptional
    cat /tmp/d_xlarge_withoptional | awk '{print NR-1, $0}' | column -t -s ' '
    echo -e $line;
       read -p "Would you like to create bench.txt:(y/n) " bench;
    echo -e $line;   
    if [ "$bench" = "y" ] || [ "$bench" = "yes" ]; then
      read -p "Please give the preferred Directory for bench.txt:(Default is Current Directory) " path1;
      if [ -z "$path1" ]; then
        path1=$(pwd);
      fi;
      rm -rf "$path1"/bench.txt*;
      echo -e $line;
      echo -e "Note: If you want to Configure FQDN separate with ';' (IP;FQDN)";
      timestamp=$(date | awk '{print $4}' | awk -F ":" '{print $1$2$3}');
      for i in $(cat $c_file | column -t -s ' ' | sed '1d' | awk '{print $1}'); do
        read -p "Enter a value for $i: " value1;
        while [ "$value1" = "" ]
        do
          read -p "Enter a value for $i: " value1;
        done;
        echo -e "$i=$value1" >> "$path1/bench.txt_$timestamp";
      done;
    mv $path1/bench.txt* $path1/bench.txt;
    echo -e $line;
    echo -e "Your bench file is here: $path1/bench.txt";
    fi 
    
    echo -e $line;
    read -p "Would you like to create bench.txt for HA:(y/n) " HAbench;
    if [ "$HAbench" = "y" ] || [ "$HAbench" = "yes" ]; then
      echo -e $line;
      read -p "Please give the preferred Directory for bench.txt:(Default is Current Directory) " path2;
      if [ -z "$path2" ]; then
        path2=$(pwd);
      fi;
      rm -rf "$path2"/HAbench.txt*;
      echo -e $line;
      echo -e "Note: If you want to Configure FQDN separate with ';' (IP;FQDN)";
      echo -e $line;
      timestamp=$(date | awk '{print $4}' | awk -F ":" '{print $1$2$3}');
      for i in $(cat $c_file | column -t -s ' ' | sed '1d' | awk '{print "HA"$1}'); do
        read -p "Enter a value for $i: " value2;
        while [ "$value2" = "" ]
        do
          read -p "Enter a value for $i: " value2;
        done;
        echo -e "$i=$value2" >> "$path2/HAbench.txt_$timestamp";
      done;
    mv $path2/HAbench.txt* $path2/HAbench.txt;
    echo -e $line;
    echo -e "Your HAbench file is here: $path2/HAbench.txt";
    fi
    
    if [ "$bench" = "y" ] || [ "$bench" = "yes" ] && [ "$HAbench" = "y" ] || [ "$HAbench" = "yes" ]; then
    echo -e $line;
    read -p "Would you like to Combine both files:(y/n) " choice;
    if [ "$choice" = "y" ] || [ "$choice" = "yes" ]; then
      cat $path1/bench.txt $path2/HAbench.txt > $path1/bench1.txt;
      echo -e $line;
      echo -e "Your Combined file is here: $path1/bench1.txt";
      echo -e $line;
    fi
    fi  

    
  }



####################################################################################

######################## Hyper-Distributed With Optional ################################

opts_hyper()
{
opt_cpu_o_l=0
opt_cpu_o_xl=0
opt_ram_o_l=0
opt_ram_o_xl=0
ws_cpu_o_l=0
ws_ram_o_l=0
ws_cpu_o_xl=0
ws_ram_o_xl=0
hive_cpu_pmh_l=0
hive_ram_pmh_l=0
hive_root_pmh_l=0
hive_cpu_pmh_xl=0
hive_ram_pmh_xl=0
hive_root_pmh_xl=0
sdh_c=0
motn_c=0
nna_cpu_mc_l=0
nna_cpu_o_l=0
nna_ram_mc_l=0
nna_ram_o_l=0
nna_root_c_l=0
nna_root_o_l=0
nna_cpu_mc_xl=0
nna_cpu_o_xl=0
nna_ram_mc_xl=0
nna_ram_o_xl=0
nna_root_c_xl=0
nna_root_o_xl=0
adb_cpu_mcpmhpms_l=0
adb_cpu_o_l=0
adb_ram_mpmhpms_l=0
adb_ram_c_l=0
adb_ram_o_l=0
adb_root_cpms_l=0
adb_root_o_l=0
adb_root_pmh_l=0
adb_cpu_mcpmhpms_xl=0
adb_cpu_o_xl=0
adb_ram_mc_xl=0
adb_ram_pmhpms_xl=0
adb_ram_o_xl=0
adb_root_cpms_xl=0
adb_root_o_xl=0
adb_root_pmh_xl=0
adc_cpu_mcpmhpms_l=0
adc_cpu_o_l=0
adc_ram_mpmhpms_l=0
adc_ram_c_l=0
adc_ram_o_l=0
adc_root_cpms_l=0
adc_root_o_l=0
adc_root_pmh_l=0
adc_cpu_mcpmhpms_xl=0
adc_cpu_o_xl=0
adc_ram_mc_xl=0
adc_ram_pmhpms_xl=0
adc_ram_o_xl=0
adc_root_cpms_xl=0
adc_root_o_xl=0
adc_root_pmh_xl=0
add_cpu_mcpmhpms_l=0
add_cpu_o_l=0
add_ram_mpmhpms_l=0
add_ram_c_l=0
add_ram_o_l=0
add_root_cpms_l=0
add_root_o_l=0
add_root_pmh_l=0
add_cpu_mcpmhpms_xl=0
add_cpu_o_xl=0
add_ram_mc_xl=0
add_ram_pmhpms_xl=0
add_ram_o_xl=0
add_root_cpms_xl=0
add_root_o_xl=0
add_root_pmh_xl=0
ade_cpu_mcpmhpms_l=0
ade_cpu_o_l=0
ade_ram_mpmhpms_l=0
ade_ram_c_l=0
ade_ram_o_l=0
ade_root_cpms_l=0
ade_root_o_l=0
ade_root_pmh_l=0
ade_cpu_mcpmhpms_xl=0
ade_cpu_o_xl=0
ade_ram_mc_xl=0
ade_ram_pmhpms_xl=0
ade_ram_o_xl=0
ade_root_cpms_xl=0
ade_root_o_xl=0
ade_root_pmh_xl=0
adf_cpu_mcpmhpms_l=0
adf_cpu_o_l=0
adf_ram_mpmhpms_l=0
adf_ram_c_l=0
adf_ram_o_l=0
adf_root_cpms_l=0
adf_root_o_l=0
adf_root_pmh_l=0
adf_cpu_mcpmhpms_xl=0
adf_cpu_o_xl=0
adf_ram_mc_xl=0
adf_ram_pmhpms_xl=0
adf_ram_o_xl=0
adf_root_cpms_xl=0
adf_root_o_xl=0
adf_root_pmh_xl=0
videos_ram_m_l=0
videos_ram_m_xl=0
}

optional_Components2L()
  {

    opts_hyper

    echo -e $line
    echo -e "\033[33mChoose one option from:\033[0m"
    echo -e $line
    echo -e "1. (WS-RC)"
    echo -e "2. WS"
    echo -e "3. Hive"
    echo -e "4. SDH"
    echo -e "5. mOTN"
    echo -e "6. NNA"
    echo -e "7. Adapter-B"
    echo -e "8. Adapter-C"
    echo -e "9. Adapter-D"
    echo -e "10. Adapter-E"
    echo -e "11. Adapter-F"
    echo -e "12. Videos"
    echo -e $line
    read -a options
    echo -e $line
    for option in "${options[@]}"
    do
    case $option in
      1) echo -e "You have chosen \033[31mOPT(WS-RC)\033[0m";
          h_L_MnCOPT_VM14;
          opt_cpu_o_l=4;
          opt_cpu_o_xl=5;
          opt_ram_o_l=24;
          opt_ram_o_xl=30;;
      2) echo -e "You have chosen \033[31mWS\033[0m";
          h_L_MnCWS_VM15;
          ws_cpu_o_l=4;
          ws_ram_o_l=24;
          ws_cpu_o_xl=5;
          ws_ram_o_xl=30;;
      3) echo -e "You have chosen \033[31mHive\033[0m";
          h_L_MnCHive_VM17;
          hive_cpu_pmh_l=1;
          hive_ram_pmh_l=6;
          hive_root_pmh_l=250;
          hive_cpu_pmh_xl=3;
          hive_ram_pmh_xl=12;
          hive_root_pmh_xl=300;;
      4) echo -e "You have chosen \033[31mSDH\033[0m";
          h_L_MnCSDH_VM19;
          sdh_c=1;;
      5) echo -e "You have chosen \033[31mmOTN\033[0m";
          h_L_MnCMOTN_VM18;
          motn_c=1;;
      6) echo -e "You have chosen \033[31mNNA\033[0m";
          h_L_MnCNNA_VM16;
          nna_cpu_mc_l=1;
          nna_cpu_o_l=2;
          nna_ram_mc_l=8;
          nna_ram_o_l=16;
          nna_root_c_l=50;
          nna_root_o_l=100;
          nna_cpu_mc_xl=2;
          nna_cpu_o_xl=3;
          nna_ram_mc_xl=10;
          nna_ram_o_xl=20;
          nna_root_c_xl=60;
          nna_root_o_xl=120;;
      7) echo -e "You have chosen \033[31mAdapter-B\033[0m";
          h_L_MnCAdapter-B_VM9;
          adb_cpu_mcpmhpms_l=1;
          adb_cpu_o_l=2;
          adb_ram_mpmhpms_l=6;
          adb_ram_c_l=8;
          adb_ram_o_l=16;
          adb_root_cpms_l=50;
          adb_root_o_l=100;
          adb_root_pmh_l=250;
          adb_cpu_mcpmhpms_xl=2;
          adb_cpu_o_xl=3;
          adb_ram_mc_xl=10;
          adb_ram_pmhpms_xl=12;
          adb_ram_o_xl=20;
          adb_root_cpms_xl=60;
          adb_root_o_xl=120;
          adb_root_pmh_xl=300;;
      8) echo -e "You have chosen \033[31mAdapter-C\033[0m";
          h_L_MnCAdapter-C_VM10;
          adc_cpu_mcpmhpms_l=1;
          adc_cpu_o_l=2;
          adc_ram_mpmhpms_l=6;
          adc_ram_c_l=8;
          adc_ram_o_l=16;
          adc_root_cpms_l=50;
          adc_root_o_l=100;
          adc_root_pmh_l=250;
          adc_cpu_mcpmhpms_xl=2;
          adc_cpu_o_xl=3;
          adc_ram_mc_xl=10;
          adc_ram_pmhpms_xl=12;
          adc_ram_o_xl=20;
          adc_root_cpms_xl=60;
          adc_root_o_xl=120;
          adc_root_pmh_xl=300;;
      9) echo -e "You have chosen \033[31mAdapter-D\033[0m";
          h_L_MnCAdapter-D_VM11;
          add_cpu_mcpmhpms_l=1;
          add_cpu_o_l=2;
          add_ram_mpmhpms_l=6;
          add_ram_c_l=8;
          add_ram_o_l=16;
          add_root_cpms_l=50;
          add_root_o_l=100;
          add_root_pmh_l=250;
          add_cpu_mcpmhpms_xl=2;
          add_cpu_o_xl=3;
          add_ram_mc_xl=10;
          add_ram_pmhpms_xl=12;
          add_ram_o_xl=20;
          add_root_cpms_xl=60;
          add_root_o_xl=120;
          add_root_pmh_xl=300;;
      10) echo -e "You have chosen \033[31mAdapter-E\033[0m";
          h_L_MnCAdapter-E_VM12;
          ade_cpu_mcpmhpms_l=1;
          ade_cpu_o_l=2;
          ade_ram_mpmhpms_l=6;
          ade_ram_c_l=8;
          ade_ram_o_l=16;
          ade_root_cpms_l=50;
          ade_root_o_l=100;
          ade_root_pmh_l=250;
          ade_cpu_mcpmhpms_xl=2;
          ade_cpu_o_xl=3;
          ade_ram_mc_xl=10;
          ade_ram_pmhpms_xl=12;
          ade_ram_o_xl=20;
          ade_root_cpms_xl=60;
          ade_root_o_xl=120;
          ade_root_pmh_xl=300;;
      11) echo -e "You have chosen \033[31mAdapter-F\033[0m";
          h_L_MnCAdapter-F_VM13;
          adf_cpu_mcpmhpms_l=1;
          adf_cpu_o_l=2;
          adf_ram_mpmhpms_l=6;
          adf_ram_c_l=8;
          adf_ram_o_l=16;
          adf_root_cpms_l=50;
          adf_root_o_l=100;
          adf_root_pmh_l=250;
          adf_cpu_mcpmhpms_xl=2;
          adf_cpu_o_xl=3;
          adf_ram_mc_xl=10;
          adf_ram_pmhpms_xl=12;
          adf_ram_o_xl=20;
          adf_root_cpms_xl=60;
          adf_root_o_xl=120;
          adf_root_pmh_xl=300;;
      12) echo -e "You have chosen \033[31mVideos\033[0m";
          videos_ram_m_l=6;
          videos_ram_m_xl=6;;
    esac
    done

    h_L_MnCMain_VM1_w()
    {
      h_L_MnCMain_VM1

      cpu=`expr $cpu + $nna_cpu_mc_l + $adb_cpu_mcpmhpms_l + $adc_cpu_mcpmhpms_l + $add_cpu_mcpmhpms_l + $ade_cpu_mcpmhpms_l + $adf_cpu_mcpmhpms_l`
      ram=`expr $ram + $nna_ram_mc_l + $adb_ram_mpmhpms_l + $adc_ram_mpmhpms_l + $add_ram_mpmhpms_l + $ade_ram_mpmhpms_l + $adf_ram_mpmhpms_l + $videos_ram_m_l`

      swap=`expr $ram / 3`

      echo -e $vm1:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncmain_withoptional
    }
    h_L_MnCCore_VM2_w()
    {
      h_L_MnCCore_VM2

      cpu=`expr $cpu + $nna_cpu_mc_l + $adb_cpu_mcpmhpms_l + $adc_cpu_mcpmhpms_l + $add_cpu_mcpmhpms_l + $ade_cpu_mcpmhpms_l + $adf_cpu_mcpmhpms_l`

      ram=`expr $ram + $nna_ram_mc_l + $adb_ram_c_l + $adc_ram_c_l + $add_ram_c_l + $ade_ram_c_l + $adf_ram_c_l`

      root=`expr $root + $nna_root_c_l + $adb_root_cpms_l + $adc_root_cpms_l + $add_root_cpms_l + $ade_root_cpms_l + $adf_root_cpms_l`

      swap=`expr $ram / 3`

      echo -e $vm2:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mnccore_withoptional

    }
    h_L_MnCInfra_VM3_w()
    {
      h_L_MnCInfra_VM3

      echo -e $vm3:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncinfra_withoptional
    }
    h_L_MnCOra_VM4_w()
    {
      h_L_MnCOra_VM4

      cpu=`expr $cpu + $opt_cpu_o_l + $ws_cpu_o_l + $nna_cpu_o_l + $adb_cpu_o_l + $adc_cpu_o_l + $add_cpu_o_l + $ade_cpu_o_l + $adf_cpu_o_l`

      ram=`expr $ram + $opt_ram_o_l + $ws_ram_o_l + $nna_ram_o_l + $adb_ram_o_l + $adc_ram_o_l + $add_ram_o_l + $ade_ram_o_l + $adf_ram_o_l`
      
      root=`expr $root + $nna_root_o_l + $adb_root_o_l + $adc_root_o_l + $add_root_o_l + $ade_root_o_l + $adf_root_o_l`

      swap=`expr $ram / 3`

      echo -e $vm4:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncora_withoptional

    }
    h_L_MnCAdapter-A_VM5_w()
    {
      h_L_MnCAdapter-A_VM5

      echo -e $vm5:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncadaptera_withoptional
    }
    h_L_MnCNSP_VM6_w()
    {
      h_L_MnCNSP_VM6

      echo -e $vm6:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncnsp_withoptional
    }
    h_L_MnCPM-H_VM7_w()
    {
      h_L_MnCPM-H_VM7

      cpu=`expr $cpu + $hive_cpu_pmh_l + $adb_cpu_mcpmhpms_l + $adc_cpu_mcpmhpms_l + $add_cpu_mcpmhpms_l + $ade_cpu_mcpmhpms_l + $adf_cpu_mcpmhpms_l`
      
      ram=`expr $ram + $hive_ram_pmh_l + $adb_ram_mpmhpms_l + $adc_ram_mpmhpms_l + $add_ram_mpmhpms_l + $ade_ram_mpmhpms_l + $adf_ram_mpmhpms_l`

      root=`expr $root + $hive_root_pmh_l + $adb_root_pmh_l + $adc_root_pmh_l + $add_root_pmh_l + $ade_root_pmh_l + $adf_root_pmh_l`

      swap=`expr $ram / 3`

      echo -e $vm7:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncpmh_withoptional
    }
    h_L_MnCPM-S_VM8_w()
    {
      h_L_MnCPM-S_VM8

      cpu=`expr $cpu + $adb_cpu_mcpmhpms_l + $adc_cpu_mcpmhpms_l + $add_cpu_mcpmhpms_l + $ade_cpu_mcpmhpms_l + $adf_cpu_mcpmhpms_l`

      ram=`expr $ram + $adb_ram_mpmhpms_l + $adc_ram_mpmhpms_l + $add_ram_mpmhpms_l + $ade_ram_mpmhpms_l + $adf_ram_mpmhpms_l`

      root=`expr $root + $adb_root_cpms_l + $adc_root_cpms_l + $add_root_cpms_l + $ade_root_cpms_l + $adf_root_cpms_l`

      swap=`expr $ram / 3`

      echo -e $vm8:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncpms_withoptional
    }

    h_L_MnCMain_VM1_w
    h_L_MnCCore_VM2_w
    h_L_MnCInfra_VM3_w
    h_L_MnCOra_VM4_w
    h_L_MnCAdapter-A_VM5_w
    h_L_MnCNSP_VM6_w
    h_L_MnCPM-H_VM7_w
    h_L_MnCPM-S_VM8_w

    c_file="/tmp/h_large_withoptional"

    echo -e VM_Name:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE | column -t -s ":" > /tmp/h_large_withoptional
    cat /tmp/h_mncmain_withoptional | column -t -s ":" >> /tmp/h_large_withoptional
    cat /tmp/h_mnccore_withoptional | column -t -s ":" >> /tmp/h_large_withoptional
    cat /tmp/h_mncinfra_withoptional | column -t -s ":" >> /tmp/h_large_withoptional
    cat /tmp/h_mncora_withoptional | column -t -s ":" >> /tmp/h_large_withoptional
    cat /tmp/h_mncadaptera_withoptional | column -t -s ":" >> /tmp/h_large_withoptional
    cat /tmp/h_mncnsp_withoptional | column -t -s ":" >> /tmp/h_large_withoptional
    cat /tmp/h_mncpmh_withoptional | column -t -s ":" >> /tmp/h_large_withoptional
    cat /tmp/h_mncpms_withoptional | column -t -s ":" >> /tmp/h_large_withoptional

    if [ $adb_cpu_mcpmhpms_l != 0 ]
    then
    cat /tmp/h_mncadapterb_withoptional | column -t -s ":" >> /tmp/h_large_withoptional;
    fi

    if [ $adc_cpu_mcpmhpms_l != 0 ]
    then
    cat /tmp/h_mncadapterc_withoptional | column -t -s ":" >> /tmp/h_large_withoptional;
    fi

    if [ $add_cpu_mcpmhpms_l != 0 ]
    then
    cat /tmp/h_mncadapterd_withoptional | column -t -s ":" >> /tmp/h_large_withoptional;
    fi

    if [ $ade_cpu_mcpmhpms_l != 0 ]
    then
    cat /tmp/h_mncadaptere_withoptional | column -t -s ":" >> /tmp/h_large_withoptional;
    fi

    if [ $adf_cpu_mcpmhpms_l != 0 ]
    then
    cat /tmp/h_mncadapterf_withoptional | column -t -s ":" >> /tmp/h_large_withoptional;
    fi

    if [ $opt_cpu_o_l != 0 ]
    then
    cat /tmp/h_mncopt_withoptional | column -t -s ":" >> /tmp/h_large_withoptional;
    fi

    if [ $ws_cpu_o_l != 0 ]
    then
    cat /tmp/h_mncws_withoptional | column -t -s ":" >> /tmp/h_large_withoptional;
    fi

    if [ $nna_cpu_mc_l != 0 ]
    then
    cat /tmp/h_mncnna_withoptional | column -t -s ":" >> /tmp/h_large_withoptional;
    fi

    if [ $hive_cpu_pmh_l != 0 ]
    then
    cat /tmp/h_mnchive_withoptional | column -t -s ":" >> /tmp/h_large_withoptional;
    fi

    if [ $motn_c != 0 ]
    then
    cat /tmp/h_mncmotn_withoptional | column -t -s ":" >> /tmp/h_large_withoptional;
    fi

    if [ $sdh_c != 0 ]
    then
    cat /tmp/h_mncsdh_withoptional | column -t -s ":" >> /tmp/h_large_withoptional;
    fi

    #column -t -s ' ' /tmp/h_large_withoptional
    cat /tmp/h_large_withoptional | awk '{print NR-1, $0}' | column -t -s ' '

    echo -e $line;
    read -p "Would you like to create bench.txt:(y/n) " bench;
    if [ "$bench" = "y" ] || [ "$bench" = "yes" ]; then
      echo -e $line;
      read -p "Please give the preferred Directory for bench.txt:(Default is Current Directory) " path1;
      if [ -z "$path1" ]; then
        path1=$(pwd);
      fi;
      rm -rf "$path1"/bench.txt*;
      echo -e $line;
      echo -e "Note: If you want to Configure FQDN separate with ';' (IP;FQDN)";
      echo -e $line;
      timestamp=$(date | awk '{print $4}' | awk -F ":" '{print $1$2$3}');
      for i in $(cat $c_file | column -t -s ' ' | sed '1d' | awk '{print $1}'); do
        read -p "Enter a value for $i: " value1;
        while [ "$value1" = "" ]
        do
          read -p "Enter a value for $i: " value1;
        done;
        echo -e "$i=$value1" >> "$path1/bench.txt_$timestamp";
      done;
    mv $path1/bench.txt* $path1/bench.txt;
    echo -e $line;
    echo -e "Your bench file is here: $path1/bench.txt";
    fi 
    
    echo -e $line;
    read -p "Would you like to create bench.txt for HA:(y/n) " HAbench;
    if [ "$HAbench" = "y" ] || [ "$HAbench" = "yes" ]; then
      echo -e $line;
      read -p "Please give the preferred Directory for bench.txt:(Default is Current Directory) " path2;
      if [ -z "$path2" ]; then
        path2=$(pwd);
      fi;
      rm -rf "$path2"/HAbench.txt*;
      echo -e $line;
      echo -e "Note: If you want to Configure FQDN separate with ';' (IP;FQDN)";
      echo -e $line;
      timestamp=$(date | awk '{print $4}' | awk -F ":" '{print $1$2$3}');
      for i in $(cat $c_file | column -t -s ' ' | sed '1d' | awk '{print "HA"$1}'); do
        read -p "Enter a value for $i: " value2;
        while [ "$value2" = "" ]
        do
          read -p "Enter a value for $i: " value2;
        done;
        echo -e "$i=$value2" >> "$path2/HAbench.txt_$timestamp";
      done;
    mv $path2/HAbench.txt* $path2/HAbench.txt;
    echo -e $line;
    echo -e "Your HAbench file is here: $path2/HAbench.txt";
    fi
    
    if [ "$bench" = "y" ] || [ "$bench" = "yes" ] && [ "$HAbench" = "y" ] || [ "$HAbench" = "yes" ]; then
    echo -e $line;
    read -p "Would you like to Combine both files:(y/n) " choice;
    if [ "$choice" = "y" ] || [ "$choice" = "yes" ]; then
      cat $path1/bench.txt $path2/HAbench.txt > $path1/bench1.txt;
      echo -e $line;
      echo -e "Your Combined file is here: $path1/bench1.txt";
      echo -e $line;
    fi
    fi  
    
  }

  optional_Components2XL()
 {

    opts_hyper

    echo -e $line
    echo -e "\033[33mChoose one option from:\033[0m"
    echo -e $line
    echo -e "1. (WS-RC)"
    echo -e "2. WS"
    echo -e "3. Hive"
    echo -e "4. SDH"
    echo -e "5. mOTN"
    echo -e "6. NNA"
    echo -e "7. Adapter-B"
    echo -e "8. Adapter-C"
    echo -e "9. Adapter-D"
    echo -e "10. Adapter-E"
    echo -e "11. Adapter-F"
    echo -e "12. Videos"
    echo -e $line
    read -a options
    echo -e $line
    for option in "${options[@]}"
    do
    case $option in
      1) echo -e "You have chosen \033[31mOPT(WS-RC)\033[0m";
          h_XL_MnCOPT_VM14;
          opt_cpu_o_l=4;
          opt_cpu_o_xl=5;
          opt_ram_o_l=24;
          opt_ram_o_xl=30;;
      2) echo -e "You have chosen \033[31mWS\033[0m";
          h_XL_MnCWS_VM15;
          ws_cpu_o_l=4;
          ws_ram_o_l=24;
          ws_cpu_o_xl=5;
          ws_ram_o_xl=30;;
      3) echo -e "You have chosen \033[31mHive\033[0m";
          h_XL_MnCHive_VM17;
          hive_cpu_pmh_l=1;
          hive_ram_pmh_l=6;
          hive_root_pmh_l=250;
          hive_cpu_pmh_xl=3;
          hive_ram_pmh_xl=12;
          hive_root_pmh_xl=300;;
      4) echo -e "You have chosen \033[31mSDH\033[0m";
          h_XL_MnCSDH_VM19;
          sdh_c=1;;
      5) echo -e "You have chosen \033[31mmOTN\033[0m";
          h_XL_MnCMOTN_VM18;
          motn_c=1;;
      6) echo -e "You have chosen \033[31mNNA\033[0m";
          h_XL_MnCNNA_VM16;
          nna_cpu_mc_l=1;
          nna_cpu_o_l=2;
          nna_ram_mc_l=8;
          nna_ram_o_l=16;
          nna_root_c_l=50;
          nna_root_o_l=100;
          nna_cpu_mc_xl=2;
          nna_cpu_o_xl=3;
          nna_ram_mc_xl=10;
          nna_ram_o_xl=20;
          nna_root_c_xl=60;
          nna_root_o_xl=120;;
      7) echo -e "You have chosen \033[31mAdapter-B\033[0m";
          h_XL_MnCAdapter-B_VM9;
          adb_cpu_mcpmhpms_l=1;
          adb_cpu_o_l=2;
          adb_ram_mpmhpms_l=6;
          adb_ram_c_l=8;
          adb_ram_o_l=16;
          adb_root_cpms_l=50;
          adb_root_o_l=100;
          adb_root_pmh_l=250;
          adb_cpu_mcpmhpms_xl=2;
          adb_cpu_o_xl=3;
          adb_ram_mc_xl=10;
          adb_ram_pmhpms_xl=12;
          adb_ram_o_xl=20;
          adb_root_cpms_xl=60;
          adb_root_o_xl=120;
          adb_root_pmh_xl=300;;
      8) echo -e "You have chosen \033[31mAdapter-C\033[0m";
          h_XL_MnCAdapter-C_VM10;
          adc_cpu_mcpmhpms_l=1;
          adc_cpu_o_l=2;
          adc_ram_mpmhpms_l=6;
          adc_ram_c_l=8;
          adc_ram_o_l=16;
          adc_root_cpms_l=50;
          adc_root_o_l=100;
          adc_root_pmh_l=250;
          adc_cpu_mcpmhpms_xl=2;
          adc_cpu_o_xl=3;
          adc_ram_mc_xl=10;
          adc_ram_pmhpms_xl=12;
          adc_ram_o_xl=20;
          adc_root_cpms_xl=60;
          adc_root_o_xl=120;
          adc_root_pmh_xl=300;;
      9) echo -e "You have chosen \033[31mAdapter-D\033[0m";
          h_XL_MnCAdapter-D_VM11;
          add_cpu_mcpmhpms_l=1;
          add_cpu_o_l=2;
          add_ram_mpmhpms_l=6;
          add_ram_c_l=8;
          add_ram_o_l=16;
          add_root_cpms_l=50;
          add_root_o_l=100;
          add_root_pmh_l=250;
          add_cpu_mcpmhpms_xl=2;
          add_cpu_o_xl=3;
          add_ram_mc_xl=10;
          add_ram_pmhpms_xl=12;
          add_ram_o_xl=20;
          add_root_cpms_xl=60;
          add_root_o_xl=120;
          add_root_pmh_xl=300;;
      10) echo -e "You have chosen \033[31mAdapter-E\033[0m";
          h_XL_MnCAdapter-E_VM12;
          ade_cpu_mcpmhpms_l=1;
          ade_cpu_o_l=2;
          ade_ram_mpmhpms_l=6;
          ade_ram_c_l=8;
          ade_ram_o_l=16;
          ade_root_cpms_l=50;
          ade_root_o_l=100;
          ade_root_pmh_l=250;
          ade_cpu_mcpmhpms_xl=2;
          ade_cpu_o_xl=3;
          ade_ram_mc_xl=10;
          ade_ram_pmhpms_xl=12;
          ade_ram_o_xl=20;
          ade_root_cpms_xl=60;
          ade_root_o_xl=120;
          ade_root_pmh_xl=300;;
      11) echo -e "You have chosen \033[31mAdapter-F\033[0m";
          h_XL_MnCAdapter-F_VM13;
          adf_cpu_mcpmhpms_l=1;
          adf_cpu_o_l=2;
          adf_ram_mpmhpms_l=6;
          adf_ram_c_l=8;
          adf_ram_o_l=16;
          adf_root_cpms_l=50;
          adf_root_o_l=100;
          adf_root_pmh_l=250;
          adf_cpu_mcpmhpms_xl=2;
          adf_cpu_o_xl=3;
          adf_ram_mc_xl=10;
          adf_ram_pmhpms_xl=12;
          adf_ram_o_xl=20;
          adf_root_cpms_xl=60;
          adf_root_o_xl=120;
          adf_root_pmh_xl=300;;
      12) echo -e "You have chosen \033[31mVideos\033[0m";
          videos_ram_m=6;;
    esac
    done

    h_XL_MnCMain_VM1_w()
    {
      h_XL_MnCMain_VM1

      cpu=`expr $cpu + $nna_cpu_mc_xl + $adb_cpu_mcpmhpms_xl + $adc_cpu_mcpmhpms_xl + $add_cpu_mcpmhpms_xl + $ade_cpu_mcpmhpms_xl + $adf_cpu_mcpmhpms_xl`
      ram=`expr $ram + $nna_ram_mc_xl + $adb_ram_mc_xl + $adc_ram_mc_xl + $add_ram_mc_xl + $ade_ram_mc_xl + $adf_ram_mc_xl + $videos_ram_m_xl`
      swap=`expr $ram / 3`

      echo -e $vm1:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncmain_withoptional
    }
    h_XL_MnCCore_VM2_w()
    {
      h_XL_MnCCore_VM2

      cpu=`expr $cpu + $nna_cpu_mc_xl + $adb_cpu_mcpmhpms_xl + $adc_cpu_mcpmhpms_xl + $add_cpu_mcpmhpms_xl + $ade_cpu_mcpmhpms_xl + $adf_cpu_mcpmhpms_xl`
      ram=`expr $ram + $nna_ram_mc_xl + $adb_ram_mc_xl + $adc_ram_mc_xl + $add_ram_mc_xl + $ade_ram_mc_xl + $adf_ram_mc_xl`
      root=`expr $root + $nna_root_c_xl + $adb_root_cpms_xl + $adc_root_cpms_xl + $add_root_cpms_xl + $ade_root_cpms_xl + $adf_root_cpms_xl`
      swap=`expr $ram / 3`

      echo -e $vm2:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mnccore_withoptional

    }
    h_XL_MnCInfra_VM3_w()
    {
      h_XL_MnCInfra_VM3

      echo -e $vm3:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncinfra_withoptional
    }
    h_XL_MnCOra_VM4_w()
    {
      h_XL_MnCOra_VM4

      cpu=`expr $cpu + $opt_cpu_o_xl + $ws_cpu_o_xl + $nna_cpu_o_xl + $adb_cpu_o_xl + $adc_cpu_o_xl + $add_cpu_o_xl + $ade_cpu_o_xl + $adf_cpu_o_xl`
      ram=`expr $ram + $opt_ram_o_xl + $ws_ram_o_xl + $nna_ram_o_xl + $adb_ram_o_xl + $adc_ram_o_xl + $add_ram_o_xl + $ade_ram_o_xl + $adf_ram_o_xl`
      root=`expr $root + $nna_root_o_xl + $adb_root_o_xl + $adc_root_o_xl + $add_root_o_xl + $ade_root_o_xl + $adf_root_o_xl`
      swap=`expr $ram / 3`

      echo -e $vm4:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncora_withoptional

    }
    h_XL_MnCAdapter-A_VM5_w()
    {
      h_XL_MnCAdapter-A_VM5

      echo -e $vm5:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncadaptera_withoptional
    }
    h_XL_MnCNSP_VM6_w()
    {
      h_XL_MnCNSP_VM6

      echo -e $vm6:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncnsp_withoptional
    }
    h_XL_MnCPM-H_VM7_w()
    {
      h_XL_MnCPM-H_VM7

      cpu=`expr $cpu + $hive_cpu_pmh_xl + $adb_cpu_mcpmhpms_xl + $adc_cpu_mcpmhpms_xl + $add_cpu_mcpmhpms_xl + $ade_cpu_mcpmhpms_xl + $adf_cpu_mcpmhpms_xl`
      ram=`expr $ram + $hive_ram_pmh_xl + $adb_ram_pmhpms_xl + $adc_ram_pmhpms_xl + $add_ram_pmhpms_xl + $ade_ram_pmhpms_xl + $adf_ram_pmhpms_xl`
      root=`expr $root + $hive_root_pmh_xl + $adb_root_pmh_xl + $adc_root_pmh_xl + $add_root_pmh_xl + $ade_root_pmh_xl + $adf_root_pmh_xl` 
      swap=`expr $ram / 3`

      echo -e $vm7:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncpmh_withoptional
    }
    h_XL_MnCPM-S_VM8_w()
    {
      h_XL_MnCPM-S_VM8

      cpu=`expr $cpu + $adb_cpu_mcpmhpms_xl + $adc_cpu_mcpmhpms_xl + $add_cpu_mcpmhpms_xl + $ade_cpu_mcpmhpms_xl + $adf_cpu_mcpmhpms_xl`
      ram=`expr $ram + $adb_ram_pmhpms_xl + $adc_ram_pmhpms_xl + $add_ram_pmhpms_xl + $ade_ram_pmhpms_xl + $adf_ram_pmhpms_xl`
      root=`expr $root + $adb_root_cpms_xl + $adc_root_cpms_xl + $add_root_cpms_xl + $ade_root_cpms_xl + $adf_root_cpms_xl`
      swap=`expr $ram / 3`

      echo -e $vm8:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncpms_withoptional
    }

    h_XL_MnCMain_VM1_w
    h_XL_MnCCore_VM2_w
    h_XL_MnCInfra_VM3_w
    h_XL_MnCOra_VM4_w
    h_XL_MnCAdapter-A_VM5_w
    h_XL_MnCNSP_VM6_w
    h_XL_MnCPM-H_VM7_w
    h_XL_MnCPM-S_VM8_w

    c_file="/tmp/h_xlarge_withoptional"

    echo -e VM_Name:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE | column -t -s ":" > /tmp/h_xlarge_withoptional
    cat /tmp/h_mncmain_withoptional | column -t -s ":" >> /tmp/h_xlarge_withoptional
    cat /tmp/h_mnccore_withoptional | column -t -s ":" >> /tmp/h_xlarge_withoptional
    cat /tmp/h_mncinfra_withoptional | column -t -s ":" >> /tmp/h_xlarge_withoptional
    cat /tmp/h_mncora_withoptional | column -t -s ":" >> /tmp/h_xlarge_withoptional
    cat /tmp/h_mncadaptera_withoptional | column -t -s ":" >> /tmp/h_xlarge_withoptional
    cat /tmp/h_mncnsp_withoptional | column -t -s ":" >> /tmp/h_xlarge_withoptional
    cat /tmp/h_mncpmh_withoptional | column -t -s ":" >> /tmp/h_xlarge_withoptional
    cat /tmp/h_mncpms_withoptional | column -t -s ":" >> /tmp/h_xlarge_withoptional

    if [ $adb_cpu_mcpmhpms_xl != 0 ]
    then
    cat /tmp/h_mncadapterb_withoptional | column -t -s ":" >> /tmp/h_xlarge_withoptional;
    fi

    if [ $adc_cpu_mcpmhpms_xl != 0 ]
    then
    cat /tmp/h_mncadapterc_withoptional | column -t -s ":" >> /tmp/h_xlarge_withoptional;
    fi

    if [ $add_cpu_mcpmhpms_xl != 0 ]
    then
    cat /tmp/h_mncadapterd_withoptional | column -t -s ":" >> /tmp/h_xlarge_withoptional;
    fi

    if [ $ade_cpu_mcpmhpms_xl != 0 ]
    then
    cat /tmp/h_mncadaptere_withoptional | column -t -s ":" >> /tmp/h_xlarge_withoptional;
    fi

    if [ $adf_cpu_mcpmhpms_xl != 0 ]
    then
    cat /tmp/h_mncadapterf_withoptional | column -t -s ":" >> /tmp/h_xlarge_withoptional;
    fi

    if [ $opt_cpu_o_xl != 0 ]
    then
    cat /tmp/h_mncopt_withoptional | column -t -s ":" >> /tmp/h_xlarge_withoptional;
    fi

    if [ $ws_cpu_o_xl != 0 ]
    then
    cat /tmp/h_mncws_withoptional | column -t -s ":" >> /tmp/h_xlarge_withoptional;
    fi

    if [ $nna_cpu_mc_xl != 0 ]
    then
    cat /tmp/h_mncnna_withoptional | column -t -s ":" >> /tmp/h_xlarge_withoptional;
    fi

    if [ $hive_cpu_pmh_xl != 0 ]
    then
    cat /tmp/h_mnchive_withoptional | column -t -s ":" >> /tmp/h_xlarge_withoptional;
    fi

    if [ $motn_c != 0 ]
    then
    cat /tmp/h_mncmotn_withoptional | column -t -s ":" >> /tmp/h_xlarge_withoptional;
    fi

    if [ $sdh_c != 0 ]
    then
    cat /tmp/h_mncsdh_withoptional | column -t -s ":" >> /tmp/h_xlarge_withoptional;
    fi

    #column -t -s ' ' /tmp/h_xlarge_withoptional
    cat /tmp/h_xlarge_withoptional | awk '{print NR-1, $0}' | column -t -s ' '
    echo -e $line;
    read -p "Would you like to create bench.txt:(y/n) " bench;
    if [ "$bench" = "y" ] || [ "$bench" = "yes" ]; then
      echo -e $line;
      read -p "Please give the preferred Directory for bench.txt:(Default is Current Directory) " path1;
      if [ -z "$path1" ]; then
        path1=$(pwd);
      fi;
      rm -rf "$path1"/bench.txt*;
      echo -e $line;
      echo -e "Note: If you want to Configure FQDN separate with ';' (IP;FQDN)";
      echo -e $line;
      timestamp=$(date | awk '{print $4}' | awk -F ":" '{print $1$2$3}');
      for i in $(cat $c_file | column -t -s ' ' | sed '1d' | awk '{print $1}'); do
        read -p "Enter a value for $i: " value1;
        while [ "$value1" = "" ]
        do
          read -p "Enter a value for $i: " value1;
        done;
        echo -e "$i=$value1" >> "$path1/bench.txt_$timestamp";
      done;
    mv $path1/bench.txt* $path1/bench.txt;
    echo -e $line;
    echo -e "Your bench file is here: $path1/bench.txt";
    fi 
    
    echo -e $line;
    read -p "Would you like to create bench.txt for HA:(y/n) " HAbench;
    if [ "$HAbench" = "y" ] || [ "$HAbench" = "yes" ]; then
      echo -e $line;
      read -p "Please give the preferred Directory for bench.txt:(Default is Current Directory) " path2;
      if [ -z "$path2" ]; then
        path2=$(pwd);
      fi;
      rm -rf "$path2"/HAbench.txt*;
      echo -e $line;
      echo -e "Note: If you want to Configure FQDN separate with ';' (IP;FQDN)";
      echo -e $line;
      timestamp=$(date | awk '{print $4}' | awk -F ":" '{print $1$2$3}');
      for i in $(cat $c_file | column -t -s ' ' | sed '1d' | awk '{print "HA"$1}'); do
        read -p "Enter a value for $i: " value2;
        while [ "$value2" = "" ]
        do
          read -p "Enter a value for $i: " value2;
        done;
        echo -e "$i=$value2" >> "$path2/HAbench.txt_$timestamp";
      done;
    mv $path2/HAbench.txt* $path2/HAbench.txt;
    echo -e $line;
    echo -e "Your HAbench file is here: $path2/HAbench.txt";
    fi
    
    if [ "$bench" = "y" ] || [ "$bench" = "yes" ] && [ "$HAbench" = "y" ] || [ "$HAbench" = "yes" ]; then
    echo -e $line;
    read -p "Would you like to Combine both files:(y/n) " choice;
    if [ "$choice" = "y" ] || [ "$choice" = "yes" ]; then
      cat $path1/bench.txt $path2/HAbench.txt > $path1/bench1.txt;
      echo -e $line;
      echo -e "Your Combined file is here: $path1/bench1.txt";
      echo -e $line;
    fi
    fi  
  }






##################### Hyper-Distributed Without Optional ##################################

  h_L_MnCMain_VM1()
  {
    cpu=6
    ram=36
    root=250
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm1="MnCMain"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/h_mncmain_withoutoptional
    echo -e $vm1:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncmain_withoutoptional
    #cat /tmp/h_mncmain_withoutoptional | column -t -s ":"
  }

  h_L_MnCCore_VM2()
  {
    cpu=4
    ram=32
    root=300
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm2="MnCCore"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/h_mnccore_withoutoptional
    echo -e $vm2:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mnccore_withoutoptional
    #cat /tmp/h_mnccore_withoutoptional | column -t -s ":"
  }

  h_L_MnCInfra_VM3()
  {
    cpu=4
    ram=32
    root=300
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm3="MnCInfra"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/h_mncinfra_withoutoptional
    echo -e $vm3:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncinfra_withoutoptional
    #cat /tmp/h_mncinfra_withoutoptional | column -t -s ":"
  }

  h_L_MnCOra_VM4()
  {
    cpu=8
    ram=64
    root=400
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm4="MnCOra"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/h_mncora_withoutoptional
    echo -e $vm4:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncora_withoutoptional
    #cat /tmp/h_mncora_withoutoptional | column -t -s ":"
  }


  h_L_MnCAdapter-A_VM5()
  {
    cpu=6
    ram=48
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm5="MnCAdapter-A"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/h_mncadaptera_withoutoptional
    echo -e $vm5:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncadaptera_withoutoptional
    #cat /tmp/h_mncadaptera_withoutoptional | column -t -s ":"
  }

  h_L_MnCNSP_VM6()
  {
    cpu=6
    ram=48
    root=250
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm6="MnCNSP"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/h_mncnsp_withoutoptional
    echo -e $vm6:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncnsp_withoutoptional
    #cat /tmp/h_mncnsp_withoutoptional | column -t -s ":"
  }

  h_L_MnCPM-H_VM7()
  {
    cpu=6
    ram=36
    root=600
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm7="MnCPM-H"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/h_mncpmh_withoutoptional
    echo -e $vm7:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncpmh_withoutoptional
    #cat /tmp/h_mncpmh_withoutoptional | column -t -s ":"
  }

  h_L_MnCPM-S_VM8()
  {
    cpu=6
    ram=36
    root=300
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm8="MnCPM-S"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/h_mncpms_withoutoptional
    echo -e $vm8:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncpms_withoutoptional
    #cat /tmp/h_mncpms_withoutoptional | column -t -s ":"
  }

  h_L_MnCAdapter-B_VM9()
  {
    cpu=6
    ram=48
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm9="MnCAdapter-B"
    echo -e $vm9:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncadapterb_withoptional
  }

  h_L_MnCAdapter-C_VM10()
  {
    cpu=6
    ram=48
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm10="MnCAdapter-C"
    echo -e $vm10:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncadapterc_withoptional
  }

  h_L_MnCAdapter-D_VM11()
  {
    cpu=6
    ram=48
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm11="MnCAdapter-D"
    echo -e $vm11:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncadapterd_withoptional
  }

  h_L_MnCAdapter-E_VM12()
  {
    cpu=6
    ram=48
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm12="MnCAdapter-E"
    echo -e $vm12:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncadaptere_withoptional
  }

  h_L_MnCAdapter-F_VM13()
  {
    cpu=6
    ram=48
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm13="MnCAdapter-F"
    echo -e $vm13:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncadapterf_withoptional
  }

  h_L_MnCOPT_VM14()
  {
    cpu=4
    ram=32
    root=250
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm14="MnCOPT"
    echo -e $vm14:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncopt_withoptional
  }

  h_L_MnCWS_VM15()
  {
    cpu=4
    ram=32
    root=250
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm15="MnCWS"
    echo -e $vm15:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncws_withoptional
  }

  h_L_MnCNNA_VM16()
  {
    cpu=6
    ram=48
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm16="MnCNNA"
    echo -e $vm16:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncnna_withoptional
  }

  h_L_MnCHive_VM17()
  {
    cpu=4
    ram=32
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm17="MnCHive"
    echo -e $vm17:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mnchive_withoptional
  }

  h_L_MnCMOTN_VM18()
  {
    cpu=4
    ram=32
    root=250
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm18="MnCMOTN"
    echo -e $vm18:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncmotn_withoptional
  }

  h_L_MnCSDH_VM19()
  {
    cpu=4
    ram=32
    root=250
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm19="MnCSDH"
    echo -e $vm19:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncsdh_withoptional
  }





  h_large_withoutoptional()
  {
    h_L_MnCMain_VM1
    h_L_MnCCore_VM2
    h_L_MnCInfra_VM3
    h_L_MnCOra_VM4
    h_L_MnCAdapter-A_VM5
    h_L_MnCNSP_VM6
    h_L_MnCPM-H_VM7
    h_L_MnCPM-S_VM8

    c_file="/tmp/h_large_withoutoptional"

    echo -e VM_Name:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE | column -t -s ":" > /tmp/h_large_withoutoptional
    cat /tmp/h_mncmain_withoutoptional | column -t -s ":" >> /tmp/h_large_withoutoptional
    cat /tmp/h_mnccore_withoutoptional | column -t -s ":" >> /tmp/h_large_withoutoptional
    cat /tmp/h_mncinfra_withoutoptional | column -t -s ":" >> /tmp/h_large_withoutoptional
    cat /tmp/h_mncora_withoutoptional | column -t -s ":" >> /tmp/h_large_withoutoptional
    cat /tmp/h_mncadaptera_withoutoptional | column -t -s ":" >> /tmp/h_large_withoutoptional
    cat /tmp/h_mncnsp_withoutoptional | column -t -s ":" >> /tmp/h_large_withoutoptional
    cat /tmp/h_mncpmh_withoutoptional | column -t -s ":" >> /tmp/h_large_withoutoptional
    cat /tmp/h_mncpms_withoutoptional | column -t -s ":" >> /tmp/h_large_withoutoptional
    #column -t -s ' ' /tmp/h_large_withoutoptional
    cat /tmp/h_large_withoutoptional | awk '{print NR-1, $0}' | column -t -s ' '
    echo -e $line;
    read -p "Would you like to create bench.txt:(y/n) " bench;
    if [ "$bench" = "y" ] || [ "$bench" = "yes" ]; then
      echo -e $line;
      read -p "Please give the preferred Directory for bench.txt:(Default is Current Directory) " path1;
      if [ -z "$path1" ]; then
        path1=$(pwd);
      fi;
      rm -rf "$path1"/bench.txt*;
      echo -e $line;
      echo -e "Note: If you want to Configure FQDN separate with ';' (IP;FQDN)";
      echo -e $line;
      timestamp=$(date | awk '{print $4}' | awk -F ":" '{print $1$2$3}');
      for i in $(cat $c_file | column -t -s ' ' | sed '1d' | awk '{print $1}'); do
        read -p "Enter a value for $i: " value1;
        while [ "$value1" = "" ]
        do
          read -p "Enter a value for $i: " value1;
        done;
        echo -e "$i=$value1" >> "$path1/bench.txt_$timestamp";
      done;
    mv $path1/bench.txt* $path1/bench.txt;
    echo -e $line;
    echo -e "Your bench file is here: $path1/bench.txt";
    fi 
    
    echo -e $line;
    read -p "Would you like to create bench.txt for HA:(y/n) " HAbench;
    if [ "$HAbench" = "y" ] || [ "$HAbench" = "yes" ]; then
      echo -e $line;
      read -p "Please give the preferred Directory for bench.txt:(Default is Current Directory) " path2;
      if [ -z "$path2" ]; then
        path2=$(pwd);
      fi;
      rm -rf "$path2"/HAbench.txt*;
      echo -e $line;
      echo -e "Note: If you want to Configure FQDN separate with ';' (IP;FQDN)";
      echo -e $line;
      timestamp=$(date | awk '{print $4}' | awk -F ":" '{print $1$2$3}');
      for i in $(cat $c_file | column -t -s ' ' | sed '1d' | awk '{print "HA"$1}'); do
        read -p "Enter a value for $i: " value2;
        while [ "$value2" = "" ]
        do
          read -p "Enter a value for $i: " value2;
        done;
        echo -e "$i=$value2" >> "$path2/HAbench.txt_$timestamp";
      done;
    mv $path2/HAbench.txt* $path2/HAbench.txt;
    echo -e $line;
    echo -e "Your HAbench file is here: $path2/HAbench.txt";
    fi
    
    if [ "$bench" = "y" ] || [ "$bench" = "yes" ] && [ "$HAbench" = "y" ] || [ "$HAbench" = "yes" ]; then
    echo -e $line;
    read -p "Would you like to Combine both files:(y/n) " choice;
    if [ "$choice" = "y" ] || [ "$choice" = "yes" ]; then
      cat $path1/bench.txt $path2/HAbench.txt > $path1/bench1.txt;
      echo -e $line;
      echo -e "Your Combined file is here: $path1/bench1.txt";
      echo -e $line;
    fi
    fi  
  }

    h_XL_MnCMain_VM1()
  {
    cpu=8
    ram=48
    root=300
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm1="MnCMain"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/h_mncmain_withoutoptional
    echo -e $vm1:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncmain_withoutoptional
    #cat /tmp/h_mncmain_withoutoptional | column -t -s ":"
  }

  h_XL_MnCCore_VM2()
  {
    cpu=5
    ram=40
    root=300
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm2="MnCCore"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/h_mnccore_withoutoptional
    echo -e $vm2:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mnccore_withoutoptional
    #cat /tmp/h_mnccore_withoutoptional | column -t -s ":"
  }

  h_XL_MnCInfra_VM3()
  {
    cpu=5
    ram=40
    root=300
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm3="MnCInfra"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/h_mncinfra_withoutoptional
    echo -e $vm3:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncinfra_withoutoptional
    #cat /tmp/h_mncinfra_withoutoptional | column -t -s ":"
  }

  h_XL_MnCOra_VM4()
  {
    cpu=10
    ram=77
    root=400
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm4="MnCOra"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/h_mncora_withoutoptional
    echo -e $vm4:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncora_withoutoptional
    #cat /tmp/h_mncora_withoutoptional | column -t -s ":"
  }


  h_XL_MnCAdapter-A_VM5()
  {
    cpu=8
    ram=58
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm5="MnCAdapter-A"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/h_mncadaptera_withoutoptional
    echo -e $vm5:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncadaptera_withoutoptional
    #cat /tmp/h_mncadaptera_withoutoptional | column -t -s ":"
  }

  h_XL_MnCNSP_VM6()
  {
    cpu=8
    ram=58
    root=250
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm6="MnCNSP"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/h_mncnsp_withoutoptional
    echo -e $vm6:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncnsp_withoutoptional
    #cat /tmp/h_mncnsp_withoutoptional | column -t -s ":"
  }

  h_XL_MnCPM-H_VM7()
  {
    cpu=8
    ram=48
    root=600
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm7="MnCPM-H"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/h_mncpmh_withoutoptional
    echo -e $vm7:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncpmh_withoutoptional
    #cat /tmp/h_mncpmh_withoutoptional | column -t -s ":"
  }

  h_XL_MnCPM-S_VM8()
  {
    cpu=8
    ram=48
    root=300
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm8="MnCPM-S"
    #echo -e VM:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE > /tmp/h_mncpms_withoutoptional
    echo -e $vm8:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncpms_withoutoptional
    #cat /tmp/h_mncpms_withoutoptional | column -t -s ":"
  }

  h_XL_MnCAdapter-B_VM9()
  {
    cpu=8
    ram=58
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm9="MnCAdapter-B"
    echo -e $vm9:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncadapterb_withoptional
  }

  h_XL_MnCAdapter-C_VM10()
  {
    cpu=8
    ram=58
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm10="MnCAdapter-C"
    echo -e $vm10:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncadapterc_withoptional
  }

  h_XL_MnCAdapter-D_VM11()
  {
    cpu=8
    ram=58
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm11="MnCAdapter-D"
    echo -e $vm11:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncadapterd_withoptional
  }

  h_XL_MnCAdapter-E_VM12()
  {
    cpu=8
    ram=58
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm12="MnCAdapter-E"
    echo -e $vm12:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncadaptere_withoptional
  }

  h_XL_MnCAdapter-F_VM13()
  {
    cpu=8
    ram=58
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm13="MnCAdapter-F"
    echo -e $vm13:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncadapterf_withoptional
  }

  h_XL_MnCOPT_VM14()
  {
    cpu=4
    ram=32
    root=250
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm14="MnCOPT"
    echo -e $vm14:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncopt_withoptional
  }

  h_XL_MnCWS_VM15()
  {
    cpu=4
    ram=32
    root=250
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm15="MnCWS"
    echo -e $vm15:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncws_withoptional
  }

  h_XL_MnCNNA_VM16()
  {
    cpu=6
    ram=48
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm16="MnCNNA"
    echo -e $vm16:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncnna_withoptional
  }

  h_XL_MnCHive_VM17()
  {
    cpu=4
    ram=32
    root=350
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm17="MnCHive"
    echo -e $vm17:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mnchive_withoptional
  }

  h_XL_MnCMOTN_VM18()
  {
    cpu=4
    ram=32
    root=250
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm18="MnCMOTN"
    echo -e $vm18:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncmotn_withoptional
  }

  h_XL_MnCSDH_VM19()
  {
    cpu=4
    ram=32
    root=250
    boot=1
    mnt=25
    swap=`expr $ram / 3`
    vm19="MnCSDH"
    echo -e $vm19:$cpu:$ram:$root:$boot:$swap:$mnt > /tmp/h_mncsdh_withoptional
  }


  h_xl_withoutoptional()
  {
    h_XL_MnCMain_VM1
    h_XL_MnCCore_VM2
    h_XL_MnCInfra_VM3
    h_XL_MnCOra_VM4
    h_XL_MnCAdapter-A_VM5
    h_XL_MnCNSP_VM6
    h_XL_MnCPM-H_VM7
    h_XL_MnCPM-S_VM8

    c_file="/tmp/h_xl_withoutoptional"

    echo -e VM_Name:CPU:RAM:ROOT:BOOT:SWAP:MAINTAINANCE | column -t -s ":" > /tmp/h_xl_withoutoptional
    cat /tmp/h_mncmain_withoutoptional | column -t -s ":" >> /tmp/h_xl_withoutoptional
    cat /tmp/h_mnccore_withoutoptional | column -t -s ":" >> /tmp/h_xl_withoutoptional
    cat /tmp/h_mncinfra_withoutoptional | column -t -s ":" >> /tmp/h_xl_withoutoptional
    cat /tmp/h_mncora_withoutoptional | column -t -s ":" >> /tmp/h_xl_withoutoptional
    cat /tmp/h_mncadaptera_withoutoptional | column -t -s ":" >> /tmp/h_xl_withoutoptional
    cat /tmp/h_mncnsp_withoutoptional | column -t -s ":" >> /tmp/h_xl_withoutoptional
    cat /tmp/h_mncpmh_withoutoptional | column -t -s ":" >> /tmp/h_xl_withoutoptional
    cat /tmp/h_mncpms_withoutoptional | column -t -s ":" >> /tmp/h_xl_withoutoptional
    #column -t -s ' ' /tmp/h_xl_withoutoptional
    cat /tmp/h_xl_withoutoptional | awk '{print NR-1, $0}' | column -t -s ' '
    echo -e $line;
    read -p "Would you like to create bench.txt:(y/n) " bench;
    if [ "$bench" = "y" ] || [ "$bench" = "yes" ]; then
      read -p "Please give the preferred Directory for bench.txt:(Default is Current Directory) " path1;
      if [ -z "$path1" ]; then
        path1=$(pwd);
      fi;
      rm -rf "$path1"/bench.txt*;
      echo -e $line;
      echo -e "Note: If you want to Configure FQDN separate with ';' (IP;FQDN)";
      echo -e $line;
      timestamp=$(date | awk '{print $4}' | awk -F ":" '{print $1$2$3}');
      for i in $(cat $c_file | column -t -s ' ' | sed '1d' | awk '{print $1}'); do
        read -p "Enter a value for $i: " value1;
        while [ "$value1" = "" ]
        do
          read -p "Enter a value for $i: " value1;
        done;
        echo -e "$i=$value1" >> "$path1/bench.txt_$timestamp";
      done;
    mv $path1/bench.txt* $path1/bench.txt;
    echo -e $line;
    echo -e "Your bench file is here: $path1/bench.txt";
    fi 
    
    echo -e $line;
    read -p "Would you like to create bench.txt for HA:(y/n) " HAbench;
    if [ "$HAbench" = "y" ] || [ "$HAbench" = "yes" ]; then
      echo -e $line;
      read -p "Please give the preferred Directory for bench.txt:(Default is Current Directory) " path2;
      if [ -z "$path2" ]; then
        path2=$(pwd);
      fi;
      rm -rf "$path2"/HAbench.txt*;
      echo -e $line;
      echo -e "Note: If you want to Configure FQDN separate with ';' (IP;FQDN)";
      echo -e $line;
      timestamp=$(date | awk '{print $4}' | awk -F ":" '{print $1$2$3}');
      for i in $(cat $c_file | column -t -s ' ' | sed '1d' | awk '{print "HA"$1}'); do
        read -p "Enter a value for $i: " value2;
        while [ "$value2" = "" ]
        do
          read -p "Enter a value for $i: " value2;
        done;
        echo -e "$i=$value2" >> "$path2/HAbench.txt_$timestamp";
      done;
    mv $path2/HAbench.txt* $path2/HAbench.txt;
    echo -e $line;
    echo -e "Your HAbench file is here: $path2/HAbench.txt";
    fi
    
    if [ "$bench" = "y" ] || [ "$bench" = "yes" ] && [ "$HAbench" = "y" ] || [ "$HAbench" = "yes" ]; then
    echo -e $line;
    read -p "Would you like to Combine both files:(y/n) " choice;
    if [ "$choice" = "y" ] || [ "$choice" = "yes" ]; then
      cat $path1/bench.txt $path2/HAbench.txt > $path1/bench1.txt;
      echo -e $line;
      echo -e "Your Combined file is here: $path1/bench1.txt";
      echo -e $line;
    fi
    fi  
  }

###############################################################################################
  
######################### Choosing Optionals #####################################################

  optionalS()
  {
    echo -e $line
    echo -e "\033[33mChoose one option from:\033[0m"
    echo -e $line
    echo -e "1. With Optional"
    echo -e "2. Without Optional"
    echo -e $line
    read option
    case $option in
      1) echo -e "You have chosen \033[31mWith Optional\033[0m";optional_Components_classic_S;;
      2) echo -e "You have chosen \033[31mWithout Optional\033[0m";c_standard_withoutoptional;;
    esac
  }

  optionalL()
  {
    echo -e $line
    echo -e "\033[33mChoose one option from:\033[0m"
    echo -e $line
    echo -e "1. With Optional"
    echo -e "2. Without Optional"
    echo -e $line
    read option
    
    case $option in
      1) echo -e "You have chosen \033[31mWith Optional\033[0m";optional_Components_classic_L;;
      2) echo -e "You have chosen \033[31mWithout Optional\033[0m";c_large_withoutoptional;;
    esac
  }

  optionalXL()
  {
    echo -e $line
    echo -e "\033[33mChoose one option from:\033[0m"
    echo -e $line
    echo -e "1. With Optional"
    echo -e "2. Without Optional"
    echo -e $line
    read option
    case $option in
      1) echo -e "You have chosen \033[31mWith Optional\033[0m";optional_Components_classic_XL;;
      2) echo -e "You have chosen \033[31mWithout Optional\033[0m";c_xl_withoutoptional;;
    esac
  }



  optional1L()
  {
    echo -e $line
    echo -e "\033[33mChoose one option from:\033[0m"
    echo -e $line
    echo -e "1. With Optional"
    echo -e "2. Without Optional"
    echo -e $line
    read option
    case $option in
      1) echo -e "You have chosen \033[31mWith Optional\033[0m";optional_Components1L;;
      2) echo -e "You have chosen \033[31mWithout Optional\033[0m";d_large_withoutoptional;;
    esac
  }

    optional1XL()
  {
    echo -e $line
    echo -e "\033[33mChoose one option from:\033[0m"
    echo -e $line
    echo -e "1. With Optional"
    echo -e "2. Without Optional"
    echo -e $line
    read option
    case $option in
      1) echo -e "You have chosen \033[31mWith Optional\033[0m";optional_Components1XL;;
      2) echo -e "You have chosen \033[31mWithout Optional\033[0m";d_xl_withoutoptional;;
    esac
  }


  

  optional2L()
  {
    echo -e $line
    echo -e "\033[33mChoose one option from:\033[0m"
    echo -e $line
    echo -e "1. With Optional"
    echo -e "2. Without Optional"
    echo -e $line
    read option
    case $option in
      1) echo -e "You have chosen \033[31mWith Optional\033[0m";optional_Components2L;;
      2) echo -e "You have chosen \033[31mWithout Optional\033[0m";h_large_withoutoptional;;
    esac
  }

    optional2XL()
  {
    echo -e $line
    echo -e "\033[33mChoose one option from:\033[0m"
    echo -e $line
    echo -e "1. With Optional"
    echo -e "2. Without Optional"
    echo -e $line
    read option
    case $option in
      1) echo -e "You have chosen \033[31mWith Optional\033[0m";optional_Components2XL;;
      2) echo -e "You have chosen \033[31mWithout Optional\033[0m";h_xl_withoutoptional;;
    esac
  }




  

  echo -e $line
  read -p "Enter Ports Requirement: " ports;

  while [ "$ports" = "" ]
  do
      echo -e $line
      read -p "Enter Ports Requirement: " ports;
  done;

  if [[ $ports -ge 1 && $ports -le 10000 ]]
  then
    echo -e $line
    echo -e "\033[33mChoose one option from:\033[0m"
    echo -e $line
    echo -e "1. Smallest wsnoc"
    echo -e "2. Classic Standard"
    echo -e "3. Classic Large"
    echo -e "4. Classic Extra Large"
    echo -e "5. Distributed Large"
    echo -e "6. Distributed Extra Large"
    echo -e "7. Hyper-Distributed Large"
    echo -e "8. Hyper-Distributed Extra Large"
    echo -e $line
    read option
    echo -e $line
    case $option in
      1) echo -e "You have chosen \033[31mSmallest wsnoc\033[0m";smallest;;
      2) echo -e "You have chosen \033[31mClassic Standard\033[0m";optionalS;;
      3) echo -e "You have chosen \033[31mClassic Large\033[0m";optionalL;;
      4) echo -e "You have chosen \033[31mClassic Extra Large\033[0m";optionalXL;;
      5) echo -e "You have chosen \033[31mDistributed Large\033[0m";optional1L;;
      6) echo -e "You have chosen \033[31mDistributed Extra Large\033[0m";optional1XL;;
      7) echo -e "You have chosen \033[31mHyper-Distributed Large\033[0m";optional2L;;
      8) echo -e "You have chosen \033[31mHyper-Distributed Extra Large\033[0m";optional2XL;;
      *) echo -e "\033[31mInvalid option\033[0m";;
    esac

  elif [[ $ports -ge 10001 && $ports -le 60000 ]]
  then
    echo -e $line
    echo -e "\033[33mChoose one option from:\033[0m"
    echo -e $line
    echo -e "1. Classic Standard"
    echo -e "2. Classic Large"
    echo -e "3. Classic Extra Large"
    echo -e "4. Distributed Large"
    echo -e "5. Distributed Extra Large"
    echo -e "6. Hyper-Distributed Large"
    echo -e "7. Hyper-Distributed Extra Large"
    echo -e $line
    read option
    echo -e $line
    case $option in
      1) echo -e "You have chosen \033[31mClassic Standard\033[0m";optionalS;;
      2) echo -e "You have chosen \033[31mClassic Large\033[0m";optionalL;;
      3) echo -e "You have chosen \033[31mClassic Extra Large\033[0m";optionalXL;;
      4) echo -e "You have chosen \033[31mDistributed Large\033[0m";optional1L;;
      5) echo -e "You have chosen \033[31mDistributed Extra Large\033[0m";optional1XL;;
      6) echo -e "You have chosen \033[31mHyper-Distributed Large\033[0m";optional2L;;
      7) echo -e "You have chosen \033[31mHyper-Distributed Extra Large\033[0m";optional2XL;;
      *) echo -e "\033[31mInvalid option\033[0m";;
    esac

  elif [[ $ports -ge 60001 && $ports -le 90000 ]]
  then
    echo -e $line
    echo -e "\033[33mChoose one option from:\033[0m"
    echo -e $line
    echo -e "1. Classic Large"
    echo -e "2. Classic Extra Large"
    echo -e "3. Distributed Large"
    echo -e "4. Distributed Extra Large"
    echo -e "5. Hyper-Distributed Large"
    echo -e "6. Hyper-Distributed Extra Large"
    echo -e $line
    read option
    echo -e $line
    case $option in
      1) echo -e "You have chosen \033[31mClassic Large\033[0m";optionalL;;
      2) echo -e "You have chosen \033[31mClassic Extra Large\033[0m";optionalXL;;
      3) echo -e "You have chosen \033[31mDistributed Large\033[0m";optional1L;;
      4) echo -e "You have chosen \033[31mDistributed Extra Large\033[0m";optional1XL;;
      5) echo -e "You have chosen \033[31mHyper-Distributed Large\033[0m";optional2L;;
      6) echo -e "You have chosen \033[31mHyper-Distributed Extra Large\033[0m";optional2XL;;
      *) echo -e "\033[31mInvalid option\033[0m";;
    esac

  elif [[ $ports -ge 90001 && $ports -le 120000 ]]
  then
    echo -e $line
    echo -e "\033[33mChoose one option from:\033[0m"
    echo -e $line
    echo -e "1. Classic Extra Large"
    echo -e "2. Distributed Large"
    echo -e "3. Distributed Extra Large"
    echo -e "4. Hyper-Distributed Extra Large"
    echo -e $line
    read option
    echo -e $line
    case $option in
      1) echo -e "You have chosen \033[31mClassic Extra Large\033[0m";optionalXL;;
      2) echo -e "You have chosen \033[31mDistributed Large(Must Select 1 Adapter)\033[0m";optional1L;;
      3) echo -e "You have chosen \033[31mDistributed Extra Large\033[0m";optional1XL;;
      4) echo -e "You have chosen \033[31mHyper-Distributed Extra Large\033[0m";optional2XL;;
      *) echo -e "\033[31mInvalid option\033[0m";;
  esac

  elif [[ $ports -ge 120001 && $ports -le 600000 ]]
  then
    echo -e $line
    echo -e "\033[33mChoose one option from:\033[0m"
    echo -e $line
    echo -e "1. Classic Extra Large"
    echo -e "2. Distributed Large"
    echo -e "3. Distributed Extra Large"
    echo -e "4. Hyper-Distributed Extra Large"
    echo -e $line
    read option
    echo -e $line
    case $option in
      1) echo -e "You have chosen \033[31mClassic Extra Large\033[0m";optionalXL;;
      2) echo -e "You have chosen \033[31mDistributed Large(Must Select required Adapter(1 per extra 90K if more than 90K ports))\033[0m";optional1L;;
      3) echo -e "You have chosen \033[31mDistributed Extra Large(Must select required Adapter(1 per extra 120K if more than 120K ports))\033[0m";optional1XL;;
      4) echo -e "You have chosen \033[31mHyper-Distributed Extra Large\033[0m";optional2XL;;
      *) echo -e "\033[31mInvalid option\033[0m";;
  esac

  else
  echo -e "\033[31mInvalid port value\033[0m"
  fi
