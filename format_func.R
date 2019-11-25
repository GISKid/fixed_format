


#Function for formatting

format_fixed_width<-function (input_file,file_name){
  
  # save_path=paste0("./Output/",file_name,".xlsx")
  read_txt=read.table(input_file,skip=2,sep="",dec="2",stringsAsFactors = FALSE)
  # writexl::write_xlsx(read_txt,save_path)
  # bad_text_just<-read.xlsx(save_path,sheetIndex = 1)
  # 
  # wb <- xlsx::createWorkbook(type = "xlsx")
  # 
  # # Creating a sheet inside the workbook.
  # sheet <- xlsx::createSheet(wb, sheetName = "Sheet0")
  # 
  # # Adding the full dataset into the sheet.
  # xlsx::addDataFrame(bad_text_just, sheet, startRow = 1, startCol = 1, row.names = FALSE, col.names = FALSE)
  # 
  # # Creating cell style needed to right-justify text.
  # cs <- CellStyle(wb) + Alignment(horizontal = "ALIGN_RIGHT")
  # 
  # # Selecting rows to apply cell style to.
  # all.rows <- getRows(sheet, rowIndex = 1:nrow(bad_text_just))
  # 
  # # Selecting cells within selected rows to apply cell style to.
  # all.cells <- getCells(all.rows)
  # 
  # # Applying cell style to selected cells.
  # invisible(lapply(all.cells, setCellStyle, cs))
  # 
  # # Saving the workbook.
  # xlsx::saveWorkbook(wb, save_path)
  # right_just<-read.xlsx(save_path,sheetIndex = 1)
  #create empty rows
  emp_rows<- read_txt[1:2,]
  emp_rows[1:2,]<-NA
  
  #insert file name into first row and first column
  emp_rows[1,1]=file_name
  emp_rows<-dplyr::bind_rows(emp_rows,right_just)
  write.fwf(as.matrix(emp_rows),file=paste0("./Output/",file_name,".WP1"),justify="right",sep="\t",width=rep(6,13),colnames=FALSE)
  
}