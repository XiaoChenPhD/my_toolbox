#! /bin/bash
# To sort regional metrics in the file structure the dpbabi GUI require
# Written by ChenXiao 20180930

Datadir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing
Targetdir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Analysis/Regional_Metrics/GUI_work/PKUGE
mkdir ${Targetdir}
Restdatadir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing/PKUGE_rest
Taskdatadir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing/PKUGE_task

Restdir=${Targetdir}/rest
Happydir=${Targetdir}/happy
Saddir=${Targetdir}/sad
Rumdir=${Targetdir}/rum
Disdir=${Targetdir}/dis
mkdir ${Restdir}
mkdir ${Happydir}
mkdir ${Saddir}
mkdir ${Rumdir}
mkdir ${Disdir}

mkdir ${Restdir}/ALFF
cp ${Restdatadir}/ResultsS/ALFF_FunImgARCW/sz* ${Restdir}/ALFF
mkdir ${Restdir}/DC
cp ${Restdatadir}/ResultsS/DegreeCentrality_FunImgARCWF/szDegreeCentrality_PositiveWeightedSumBrainMap* ${Restdir}/DC
mkdir ${Restdir}/fALFF
cp ${Restdatadir}/ResultsS/fALFF_FunImgARCW/sz* ${Restdir}/fALFF
mkdir ${Restdir}/ReHo
cp ${Restdatadir}/ResultsS/ReHo_FunImgARCWF/sz* ${Restdir}/ReHo
mkdir ${Restdir}/VMHC
cp ${Restdatadir}/ResultsS/VMHC_FunImgARCWFsymS/sz* ${Restdir}/VMHC

mkdir ${Happydir}/ALFF
cp ${Taskdatadir}/ResultsS/ALFF_FunImgARCW/sz* ${Happydir}/ALFF
mkdir ${Happydir}/DC
cp ${Taskdatadir}/ResultsS/DegreeCentrality_FunImgARCWF/szDegreeCentrality_PositiveWeightedSumBrainMap* ${Happydir}/DC
mkdir ${Happydir}/fALFF
cp ${Taskdatadir}/ResultsS/fALFF_FunImgARCW/sz* ${Happydir}/fALFF
mkdir ${Happydir}/ReHo
cp ${Taskdatadir}/ResultsS/ReHo_FunImgARCWF/sz* ${Happydir}/ReHo
mkdir ${Happydir}/VMHC
cp ${Taskdatadir}/ResultsS/VMHC_FunImgARCWFsymS/sz* ${Happydir}/VMHC

mkdir ${Saddir}/ALFF
cp ${Taskdatadir}/S2_ResultsS/ALFF_FunImgARCW/sz* ${Saddir}/ALFF
mkdir ${Saddir}/DC
cp ${Taskdatadir}/S2_ResultsS/DegreeCentrality_FunImgARCWF/szDegreeCentrality_PositiveWeightedSumBrainMap* ${Saddir}/DC
mkdir ${Saddir}/fALFF
cp ${Taskdatadir}/S2_ResultsS/fALFF_FunImgARCW/sz* ${Saddir}/fALFF
mkdir ${Saddir}/ReHo
cp ${Taskdatadir}/S2_ResultsS/ReHo_FunImgARCWF/sz* ${Saddir}/ReHo
mkdir ${Saddir}/VMHC
cp ${Taskdatadir}/S2_ResultsS/VMHC_FunImgARCWFsymS/sz* ${Saddir}/VMHC

mkdir ${Rumdir}/ALFF
cp ${Taskdatadir}/S3_ResultsS/ALFF_FunImgARCW/sz* ${Rumdir}/ALFF
mkdir ${Rumdir}/DC
cp ${Taskdatadir}/S3_ResultsS/DegreeCentrality_FunImgARCWF/szDegreeCentrality_PositiveWeightedSumBrainMap* ${Rumdir}/DC
mkdir ${Rumdir}/fALFF
cp ${Taskdatadir}/S3_ResultsS/fALFF_FunImgARCW/sz* ${Rumdir}/fALFF
mkdir ${Rumdir}/ReHo
cp ${Taskdatadir}/S3_ResultsS/ReHo_FunImgARCWF/sz* ${Rumdir}/ReHo
mkdir ${Rumdir}/VMHC
cp ${Taskdatadir}/S3_ResultsS/VMHC_FunImgARCWFsymS/sz* ${Rumdir}/VMHC

mkdir ${Disdir}/ALFF
cp ${Taskdatadir}/S4_ResultsS/ALFF_FunImgARCW/sz* ${Disdir}/ALFF
mkdir ${Disdir}/DC
cp ${Taskdatadir}/S4_ResultsS/DegreeCentrality_FunImgARCWF/szDegreeCentrality_PositiveWeightedSumBrainMap* ${Disdir}/DC
mkdir ${Disdir}/fALFF
cp ${Taskdatadir}/S4_ResultsS/fALFF_FunImgARCW/sz* ${Disdir}/fALFF
mkdir ${Disdir}/ReHo
cp ${Taskdatadir}/S4_ResultsS/ReHo_FunImgARCWF/sz* ${Disdir}/ReHo
mkdir ${Disdir}/VMHC
cp ${Taskdatadir}/S4_ResultsS/VMHC_FunImgARCWFsymS/sz* ${Disdir}/VMHC
