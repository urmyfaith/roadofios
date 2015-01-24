# -*- coding: utf-8 -*
import xlrd

#open excel
data=xlrd.open_workbook('qa2.xlsx')
data.sheet_names()

#get table
table=data.sheets()[0]



#get rowCount and coloumnCount
nrows = table.nrows
ncols = table.ncols
#print nrows
#print ncols

#print one row
for rownum in range(table.nrows):
    oneRow_list=table.row_values(rownum)
    str1="|"
    str2=""
    for column_index in range(len(oneRow_list)):
        cell=oneRow_list[column_index]
        #print type(cell)
        if isinstance(cell,float):
            cell=int(float(cell))# float==>int
            str2+='%04d'%cell# int ===>str
        if isinstance(cell,unicode):
            str2+=cell.encode('utf-8')
        if isinstance(cell,str):
            str2+=cell
        if column_index==ncols-1 and rownum!=0:
            str2+=" --- |"
        else:
            str2+="|"
    oneRowString=str1+str2
    print oneRowString

#usage
# python xlsx2mdtable.py > x.txt
# python xlsx2mdTable.py > x.txt && open x.txt
