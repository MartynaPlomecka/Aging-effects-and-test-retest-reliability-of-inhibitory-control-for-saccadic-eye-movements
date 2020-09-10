
#data used in pilot


#old "A0", "A4", "A9", "B0","C2","F3", "F4" , "F5", "F6", "F9","H0","H6", "L7", "M5","N0", "N6", "N9", "U1","V1", "Y0"))
  
  
#yng  "A2", "C0", "C1", "C7", "D1", "D3", "D5", "D6", "D8", "E1", "E6", "I1","I5", "K4", "L4", "N1", "N3", "P0", "Q6", "Q9")

#G0 i P8 -> rejected

pilot <- read.table("/Users/mplome/dev/STAGE2/Preparation_code/50agg.csv", header = TRUE, sep=",")

normal <- read.table("/Users/mplome/dev/STAGE2/Data/full_data_agg.csv", header = TRUE, sep=",")

#############################################################
# 1.sprawdzil ktore z powyzszych zostaly wsadzone do NORMAL #
#############################################################
unique_pilot = unique(pilot$id)

# > unique_pilot
# [1] A0 A2 A4 A9 B0 C0 C1 C2 C7 D1 D3 D5 D6 D8 E1 E6 F3 F4 F5 F6 F9 H0 H6 I1 I5 K4
#[27] L4 L7 M5 N0 N1 N3 N6 N9 P0 Q6 Q9 U1 V1 Y0

is_in_study = unique_pilot %in% normal$sbj_id
pilot_in_study = unique_pilot[is_in_study]

# > pilot_in_study
# [1] D1 D3 D5 D6 D8 E1 E6 I1 I5 K4 L4 N0 N1 N3 N9 P0 Q6 Q9 U1 V1 Y0

# BASH command to check date of the last modification
# for ss in `ls`; do stat -f "%N %Sm" $ss/${ss}_ASA.mat; done