DIR:`:/home/krishna/Downloads/qlearn

dirs:`ABC`DEF`GHI`JKL`MNO`PQR`STU`VWXYZ!hsym each`$read0 ` sv DIR,`par.txt
gp:.Q.fu {[s] key[dirs]0 3 6 9 12 15 18 21 bin .Q.A?first each string s,()}
saveonepart:{[dt;tablename;part2save] show part2save; show "*";(` sv dirs[part2save],(`$string dt),tablename,`)}
colStr:"PSSEIEISISSSSSSSSSSPSSS"
rd:.Q.fc[{(colStr;enlist"|")0:x}]


/.Q.fpn[{select date:distinct`date$Time by Symbol from rd x};`:out;55000000] 
.Q.fpn[foo;`:out;55000000] 
wr:{show z;show select from x where part=y`part}
foo:{ x:update part:gp Symbol from rd x; t:select distinct date: `date$Time by part from x;{p:` sv 'dirs[y`part],/:(`$string raze y`date),\:`QUOTE,`;wr[x;y]each p;}[x]each 0!t}
