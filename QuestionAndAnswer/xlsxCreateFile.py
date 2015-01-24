# -*- coding: utf-8 -*
import xlrd
import os

#open excel
data=xlrd.open_workbook('qa2.xlsx')
data.sheet_names()

#get table
table=data.sheets()[0]

#get rowCount and coloumnCount
nrows = table.nrows
ncols = table.ncols



#print one row
for rownum in range(table.nrows):
    
    oneRow_list=table.row_values(rownum)
    if rownum!=0:
        cell0=oneRow_list[0]
        cell0Value=""
        cell2Vaule=""
        if isinstance(cell0,float):
            cell0Value=int(float(cell0))# float==>int
            cell0Value='%04d'%cell0Value# int ===>str

        cell2=oneRow_list[2]
        if isinstance(cell2,unicode):
            cell2Vaule=cell2.encode('utf-8')
            cell2Vaule=cell2Vaule.replace('/','_')
        #create file
        filename=cell0Value+"_"+cell2Vaule+".md"
        cmd_makefile="touch \""+filename+"\""
        os.popen(cmd_makefile)

