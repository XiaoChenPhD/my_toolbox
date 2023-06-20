# to sort Dong_Beijing  written by ChenXiao 20170101
#initialize
workdir=/mnt/diske/Yan/YanLab/ChenXiao/Nanning_data/Dong_Beijing/Dong_Beijing_sorted
targetdir=/mnt/diske/Yan/YanLab/ChenXiao/Nanning_data/Dong_Beijing/Dong_Beijing_dpabi

T1dir=${targetdir}/T1Raw
Functiondir1=${targetdir}/S1_FunRaw  #eye closed
Functiondir2=${targetdir}/S2_FunRaw  #eye closed
Functiondir3=${targetdir}/S3_FunRaw  #eye open
Sub_list=/mnt/diske/Yan/YanLab/ChenXiao/Nanning_data/Dong_Beijing/Dong_Beijing_Sublist.list
Design_list=/mnt/diske/Yan/YanLab/ChenXiao/Nanning_data/Dong_Beijing/Dong_Beijing_design.list
i=0

for iSub in `cat ${Sub_list}`
	do
	let i=i+1
	mkdir ${T1dir}/${iSub:2:3}
	cp -r ${workdir}/${iSub#*_}/0005_t1_mprage_sag/* ${T1dir}/${iSub:2:3}	

	mkdir ${Functiondir1}/${iSub:2:3}
	cp -r ${workdir}/${iSub#*_}/0002_ge_func_31x31x35_240_RS/* ${Functiondir1}/${iSub:2:3}

	mkdir ${Functiondir2}/${iSub:2:3}
	mkdir ${Functiondir3}/${iSub:2:3}
	D=`cat ${Design_list} | sed -n "${i}p" `
		if [ ${D} == "open" ];then
			cp -r ${workdir}/${iSub#*_}/0003_ge_func_31x31x35_240_RS/* ${Functiondir3}/${iSub:2:3}
			cp -r ${workdir}/${iSub#*_}/0004_ge_func_31x31x35_240_RS/* ${Functiondir2}/${iSub:2:3}
			echo "3_3;4_2"
		else
			cp -r ${workdir}/${iSub#*_}/0003_ge_func_31x31x35_240_RS/* ${Functiondir2}/${iSub:2:3}
			cp -r ${workdir}/${iSub#*_}/0004_ge_func_31x31x35_240_RS/* ${Functiondir3}/${iSub:2:3}
			echo "3_2;4_3"
		fi 	
	echo ${iSub} ${D}
	done
