DIR:`:/home/krishna/Downloads/qlearn

dirs:`ABC`DEF`GHI`JKL`MNO`PQR`STU`VWXYZ!hsym each`$read0 ` sv DIR,`par.txt
gp:.Q.fu {[s] key[dirs]0 3 6 9 12 15 18 21 bin .Q.A?first each string s,()}
saveonepart:{[dt;tablename;part2save] show part2save; show "*";(` sv dirs[part2save],(`$string dt),tablename,`)}
colStr:"PSSEIEISISSSSSSSSSSPSSS"
c:`Time`Exchange`Symbol`Bid_Price`Bid_Size`Offer_Price`Offer_Size`Quote_Condition`Sequence_Number`National_BBO_Ind`FINRA_BBO_Indicator`FINRA_ADF_MPID_Indicator`Quote_Cancel_Correction`Source_Of_Quote`Retail_Interest_Indicator`Short_Sale_Restriction_Indicator`LULD_BBO_Indicator`SIP_Generated_Message_Identifier`National_BBO_LULD_Indicator`Participant_Timestamp`FINRA_ADF_Timestamp`FINRA_ADF_Market_Participant_Quote_Indicator`Security_Status_Indicator
rd:.Q.fc[{flip c!(colStr;"|")0:x}]
wr:{show z;show y;show select from x where part=y,date="D"$("/" vs string z)3}
foo:{x:update part:gp Symbol,date:`date$Time from rd x; t:select distinct date by part from x;{p:` sv 'dirs[y`part],/:(`$string raze y`date),\:`QUOTE,`;wr[x;y`part]each p;}[x]each 0!t}
.Q.fpn[foo;`:tt;55000000] 
