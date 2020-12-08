# Reading in the data
cop <- read.csv('C:/Users/vyabo/OneDrive/Police Shootings/fatal-police-shootings-data.csv')
unique(cop$race)

# Creating the subsets of unarmed people killed by race
B_unarm <- nrow(subset(cop,race=='B' & (armed=='unarmed' | armed=='toy weapon')))
W_unarm <- nrow(subset(cop,race=='W' & (armed=='unarmed' | armed=='toy weapon')))
H_unarm <- nrow(subset(cop,race=='H' & (armed=='unarmed' | armed=='toy weapon')))
A_unarm <- nrow(subset(cop,race=='A' & (armed=='unarmed' | armed=='toy weapon')))
N_unarm <- nrow(subset(cop,race=='N' & (armed=='unarmed' | armed=='toy weapon')))
O_unarm <- nrow(subset(cop,race=='O' & (armed=='unarmed' | armed=='toy weapon')))

# Creating the proportions of unarmed people killed by race
B <- nrow(subset(cop,race=='B'))
W <- nrow(subset(cop,race=='W'))
H <- nrow(subset(cop,race=='H'))
A <- nrow(subset(cop,race=='A'))
N <- nrow(subset(cop,race=='N'))
O <- nrow(subset(cop,race=='O'))
prop_Af_Am <- B_unarm/B
prop_W <- W_unarm/W
prop_H <- H_unarm/H
prop_A <- A_unarm/A
prop_N <- N_unarm/N
prop_O <- O_unarm/O

# Conducting a proportions test to determine if proportion of unarmed black people killed is greater than unarmed white people killed by police
prop.test(c(B_unarm,W_unarm),c(B,W),alternative = 'greater')

# Creating proportions of unarmed people killed by cops by race relative to their respective populations in US
B_per_mil <- B_unarm/43.984096082
W_per_mil <- W_unarm/249.46203748
A_per_mil <- A_unarm/19.366131857
N_per_mil <- N_unarm/4.267113799
H_per_mil <- H_unarm/60.724311755

# Creating proportions of total people killed by cops by race relative to their respective populations in US
B_mil_tot <- B/43.984096082
W_mil_tot <- W/249.46203748
A_mil_tot <- A/19.366131857
N_mil_tot <- N/4.267113799
H_mil_tot <- H/60.724311755

#Conducting proportion tests to see if proportions of unarmed/all black people killed relative to the total population is greater than the proportions of white people killed
prop.test(c(B_unarm,W_unarm),c(43.984096082*1000000,249.46203748*1000000),alternative = 'greater')
prop.test(c(B,W),c(43.984096082*1000000,249.46203748*1000000),alternative = 'greater')

# Saving the proportions to use later with Tableau
cop1 <- data.frame(cop,prop_Af_Am,prop_W,prop_H,prop_A,prop_N,prop_O)
cop1
cop1 <- data.frame(cop1,B_per_mil,W_per_mil,A_per_mil,N_per_mil,H_per_mil,B_mil_tot,W_mil_tot,A_mil_tot,N_mil_tot,H_mil_tot)
write.csv(cop1,'C:/Users/vyabo/OneDrive/Police Shootings/fatal-police-shootings-props.csv')

