DIR:`:/home/krishna/Downloads/qlearn

dirs:`ABC`DEF`GHI`JKL`MNO`PQR`STU`VWXYZ!hsym each`$read0 ` sv DIR,`par.txt
gp:.Q.fu {[s] key[dirs]0 3 6 9 12 15 18 21 bin .Q.A?first each string s,()}
saveonepart:{[dt;tablename;part2save] show part2save; show "*";(` sv dirs[part2save],(`$string dt),tablename,`)}
colStr:"PCSEIEICICCCCCCCCCCPCCC"
/colStr:"PSSEIEISISSSSSSSSSSPSSS"
c:`Time`Exchange`Symbol`Bid_Price`Bid_Size`Offer_Price`Offer_Size`Quote_Condition`Sequence_Number`National_BBO_Ind`FINRA_BBO_Indicator`FINRA_ADF_MPID_Indicator`Quote_Cancel_Correction`Source_Of_Quote`Retail_Interest_Indicator`Short_Sale_Restriction_Indicator`LULD_BBO_Indicator`SIP_Generated_Message_Identifier`National_BBO_LULD_Indicator`Participant_Timestamp`FINRA_ADF_Timestamp`FINRA_ADF_Market_Participant_Quote_Indicator`Security_Status_Indicator
/ read in parallel
rd:.Q.fc[{flip c!(colStr;"|")0:x}]
/ get parts based on partitions
fpth:{` sv 'dirs[x`part],/:(`$string raze x`date),\:`QUOTE,`}
/ create appended path
pth:{` sv DIR,`$(":" vs string x)1}
/ get date from path e.g `:/data/7/2000.01.01/QUOTE/
dt:{"D"$("/" vs string x)3}
/ get data payload from chunk to write to disk
gd:{date:dt[z];show z;delete part from select from x where part=y,date=date}
/ write to disk with enum -x-chunk,y-partition from gp,z-path-`:/data/7/2000.01.01/QUOTE/
wr:{show y;pth[z] set .Q.en[pth[z]] gd[x;y;z]}
/foo:{x:update part:gp Symbol,date:`date$Time from rd x; t:select distinct date by part from x;{p:` sv 'dirs[y`part],/:(`$string raze y`date),\:`QUOTE,`;wr[x;y`part]each p;}[x]each 0!t}
foo:{
 x:update part:gp Symbol,date:`date$Time from rd x;t:select distinct date by part from x;
 {p:fpth[y];wr[x;y`part]each p;}[x]each 0!t}


.Q.fpn[foo;`:tt;55000000] 
