package it.will.kingsmap.getMetod;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Component;

import com.opencsv.CSVReader;

import it.will.kingsmap_mybatis.dto.AptDTO;
import it.will.kingsmap_mybatis.dto.DandockDTO;
import it.will.kingsmap_mybatis.dto.GongsiDTO;
import it.will.kingsmap_mybatis.dto.PreviewDTO;
import it.will.kingsmap_mybatis.dto.VillaDTO;
import it.will.kingsmap_mybatis.service.AdminService;

@Component
public class AdminUtil {
	
	private static String prg="0";

	public static void setPrg(String prg) {
		AdminUtil.prg = prg;
	}

	public static List<PreviewDTO> printExcel(File file, String type) throws Exception {
		FileInputStream fis=new FileInputStream(file);
		Workbook workbook=new XSSFWorkbook(fis);
		List<PreviewDTO> viewList=new ArrayList<PreviewDTO>();
		
		XSSFSheet sheet=(XSSFSheet)workbook.getSheetAt(0);
		XSSFRow row=null;
		XSSFCell cell=null;
		fis.close();
		workbook.close();
		
		int rows=sheet.getLastRowNum();
		
		int startRow=0;
		for(int rowCnt=0;rowCnt<rows;rowCnt++) {
			row=sheet.getRow(rowCnt);
			try {
				if(row.getLastCellNum()<2) {
					continue;	
				} else {
					startRow=row.getRowNum();
					break;
				}
			} catch (Exception exc) {
				continue;
			}
		}
		PreviewDTO preview=new PreviewDTO();
		List<String> cellList=null;
		preview.setA("전체 행의 수 : "+rows);
		preview.setB("");
		preview.setC("");
		preview.setD("");
		preview.setE("");
		preview.setF("");
		preview.setG("");
		preview.setH("");
		preview.setI("");
		preview.setJ("");
		preview.setK("");
		preview.setL("");
		preview.setM("");
		preview.setN("");
		viewList.add(preview);
		
		for(int rowCnt=startRow;rowCnt<=rows;rowCnt++) {
			row=sheet.getRow(rowCnt);
			
			int cells=0;
			try {
				cells=row.getLastCellNum();
			} catch (Exception exc) {
				continue;
			}
			preview=new PreviewDTO();
			cellList=new ArrayList<String>();
			for(int cellCnt=0;cellCnt<cells;cellCnt++) {
				cell=row.getCell(cellCnt);
				
				String cellVal=cell.getStringCellValue();
			
				if(cellVal==null || cellVal.equals("")) {
					cellVal="";
				}
				cellVal=cellVal.trim();
				
				cellList.add(cellVal);
			}
			if(type.equals("2")||type.equals("4")) {
				if(cellList.size()!=14) {
					throw new Exception();
				}
			}
			if(type.equals("3")) {
				if(cellList.size()!=13) {
					throw new Exception();
				}
				cellList.add(13,"");
			}
			if(type.equals("1")) {
				if(cellList.size()!=12) {
					throw new Exception();
				}
				cellList.add(12,"");
				cellList.add(13,"");
			}
			if(type.equals("5")||type.equals("6")) {
				if(cellList.size()!=11) {
					throw new Exception();
				}
				cellList.add(11,"");
				cellList.add(12,"");
				cellList.add(13,"");
			}
			preview.setA(cellList.get(0));
			preview.setB(cellList.get(1));
			preview.setC(cellList.get(2));
			preview.setD(cellList.get(3));
			preview.setE(cellList.get(4));
			preview.setF(cellList.get(5));
			preview.setG(cellList.get(6));
			preview.setH(cellList.get(7));
			preview.setI(cellList.get(8));
			preview.setJ(cellList.get(9));
			preview.setK(cellList.get(10));
			preview.setL(cellList.get(11));
			preview.setM(cellList.get(12));
			preview.setN(cellList.get(13));
			viewList.add(preview);
			if(viewList.size()>=16) break;
		}
		return viewList;
	}		
	
	
	public static String updateExcel(File file, AdminService adminService, String type) throws Exception {
		List<Object> list=new ArrayList<Object>();
		FileInputStream fis=new FileInputStream(file);
		Workbook workbook=new XSSFWorkbook(fis);
		XSSFSheet sheet=(XSSFSheet)workbook.getSheetAt(0);
		XSSFRow row=null;
		XSSFCell cell=null;
		
		fis.close();
		workbook.close();
		
		int rows=sheet.getLastRowNum();
		int startRow=0;
		for(int rowCnt=0;rowCnt<rows;rowCnt++) {
			row=sheet.getRow(rowCnt);
			try {
				if(row.getLastCellNum()<2) {
					continue;	
				} else {
					startRow=row.getRowNum()+1;
					break;
				}
			} catch (Exception exc) {
				continue;
			}
		}
		List<String> cellList=null;
		AptDTO aptDTO=null;
		VillaDTO villaDTO=null;
		DandockDTO dandockDTO=null;
		//System.out.println(rows);
		for(int rowCnt=startRow;rowCnt<=rows;rowCnt++) {
			row=sheet.getRow(rowCnt);
			int cells=0;
			try {
				cells=row.getLastCellNum();
			} catch (Exception exc) {
				continue;
			}
			aptDTO=new AptDTO();
			villaDTO=new VillaDTO();
			dandockDTO=new DandockDTO();
			cellList=new ArrayList<String>();
			prg=(((rowCnt+1-startRow)*100)/(rows-startRow))+"";
			if(rowCnt==rows) {
				prg="100";
			}
			//System.out.println(cells);
			for(int cellCnt=0;cellCnt<cells;cellCnt++) {
				cell=row.getCell(cellCnt);
				
				String cellVal=cell.getStringCellValue();
			
				if(cellVal==null || cellVal.equals("")) {
					cellVal="";
				}
				cellVal=cellVal.trim();
				
				cellList.add(cellVal);
			}
			if(type.equals("1")||type.equals("2")) {
				if(!(cells==12 || cells==14)) {
					throw new Exception();
				}
				if(type.equals("1")) {
					cellList.add(5, "매매");
					cellList.add(10,"0");
					cellList.add(11,"0");
				} else if(type.equals("2")) {
					cellList.add(9,"0");
				}
				aptDTO.setADDROLD(cellList.get(0));
				aptDTO.setADDRNUM(cellList.get(1));
				aptDTO.setADDRNUM1(cellList.get(2));
				aptDTO.setADDRNUM2(cellList.get(3));
				aptDTO.setNAME(cellList.get(4));
				aptDTO.setTYPE(cellList.get(5));
				aptDTO.setCONTRACT(cellList.get(6));
				aptDTO.setYMDATE(cellList.get(7));
				aptDTO.setDDATE(cellList.get(8));
				aptDTO.setTRADING(cellList.get(9));
				aptDTO.setDEPOSIT(cellList.get(10));
				aptDTO.setMONTHLY(cellList.get(11));
				aptDTO.setFLOOR(cellList.get(12));
				aptDTO.setYBUILD(cellList.get(13));
				aptDTO.setNEWADDR(cellList.get(14));
				list.add(aptDTO);
				
			} else if(type.equals("3")||type.equals("4")) {
				if(!(cells==13 || cells==14)) {
					throw new Exception();
				}
				if(type.equals("3")) {
					cellList.add(5, "매매");
					cellList.add(11,"0");
					cellList.add(12,"0");
				} else if(type.equals("4")) {
					cellList.add(7,"0");
					cellList.add(10,"0");
				}
				villaDTO.setADDROLD(cellList.get(0));
				villaDTO.setADDRNUM(cellList.get(1));
				villaDTO.setADDRNUM1(cellList.get(2));
				villaDTO.setADDRNUM2(cellList.get(3));
				villaDTO.setNAME(cellList.get(4));
				villaDTO.setTYPE(cellList.get(5));
				villaDTO.setCONTRACT(cellList.get(6));
				villaDTO.setSILCONTRACT(cellList.get(7));
				villaDTO.setYMDATE(cellList.get(8));
				villaDTO.setDDATE(cellList.get(9));
				villaDTO.setTRADING(cellList.get(10));
				villaDTO.setDEPOSIT(cellList.get(11));
				villaDTO.setMONTHLY(cellList.get(12));
				villaDTO.setFLOOR(cellList.get(13));
				villaDTO.setYBUILD(cellList.get(14));
				villaDTO.setNEWADDR(cellList.get(15));
				list.add(villaDTO);
			} else if(type.equals("5")||type.equals("6")) {
				if(cells!=11) {
					throw new Exception();
				}
				if(type.equals("5")) {
					cellList.add(6,"매매");
					cellList.add(10,"0");
					cellList.add(11,"0");
				} else if(type.equals("6")) {
					cellList.add(2,"전월세");
					cellList.add(5,"0");
					cellList.add(9,"0");
				}
				dandockDTO.setADDROLD(cellList.get(0));
				dandockDTO.setADDRNUM(cellList.get(1));
				dandockDTO.setTYPE(cellList.get(2));
				dandockDTO.setROAD(cellList.get(3));
				dandockDTO.setCONTRACT(cellList.get(4));
				dandockDTO.setSILCONTRACT(cellList.get(5));
				dandockDTO.setCTYPE(cellList.get(6));
				dandockDTO.setYMDATE(cellList.get(7));
				dandockDTO.setDDATE(cellList.get(8));
				dandockDTO.setTRADING(cellList.get(9));
				dandockDTO.setDEPOSIT(cellList.get(10));
				dandockDTO.setMONTHLY(cellList.get(11));
				dandockDTO.setYBUILD(cellList.get(12));
				dandockDTO.setNEWADDR(cellList.get(13));
				list.add(dandockDTO);
			}
			
			if(list.size()>1000 || rowCnt==rows) {
				if(type.equals("1")||type.equals("2")) {
					List<AptDTO> aptList=new ArrayList<AptDTO>();
					for(int i=0;i<list.size();i++) {
						aptList.add(i,(AptDTO)list.get(i));
					}
					adminService.addApart(aptList);
				}
				if(type.equals("3")||type.equals("4")) {
					List<VillaDTO> villaList=new ArrayList<VillaDTO>();
					for(int i=0;i<list.size();i++) {
						villaList.add(i,(VillaDTO)list.get(i));
					}
					adminService.addVilla(villaList);
				}
				if(type.equals("5")||type.equals("6")) {
					List<DandockDTO> dandockList=new ArrayList<DandockDTO>();
					for(int i=0;i<list.size();i++) {
						dandockList.add(i,(DandockDTO)list.get(i));
					}
					adminService.addDandock(dandockList);
				}
				list=new ArrayList<Object>();
			}
		}
		return "success";
	}
	
	public static String getPrg() {
		return prg;
	}
	
	
	public static List<PreviewDTO> gongsiView(File file) throws IOException {
		InputStreamReader isr=new InputStreamReader(new FileInputStream(file));
		CSVReader reader=new CSVReader(isr);
		List<String[]> csv=reader.readAll();
		List<PreviewDTO> csvList=new ArrayList<PreviewDTO>();
		PreviewDTO csvDTO=new PreviewDTO();
		
		reader.close();
		
		for(String[] array:csv) {
			csvDTO.setA(array[0]);
			csvDTO.setB(array[1]);
			csvDTO.setC(array[2]);
			csvDTO.setD(array[3]);
			csvDTO.setE(array[4]);
			csvDTO.setF(array[5]);
			csvDTO.setG(array[6]);
			csvDTO.setH(array[7]);
			csvDTO.setI(array[8]);
			csvDTO.setJ(array[9]);
			csvDTO.setK(array[10]);
			csvDTO.setL(array[11]);
			csvList.add(csvDTO);
			csvDTO=new PreviewDTO();
			if(csvList.size()>=16) break;
		}
		return csvList;
	}
	
	public static String gongsiUp(File file, AdminService adminService) throws IOException {
		InputStreamReader isr=new InputStreamReader(new FileInputStream(file));
		CSVReader reader=new CSVReader(isr);
		List<String[]> csv=reader.readAll();
		List<GongsiDTO> csvList=new ArrayList<GongsiDTO>();
		GongsiDTO csvDTO=null;
		
		reader.close();
		for(int i=1;i<csv.size();i++) {
			System.out.println(csv.size());
			csvDTO=new GongsiDTO();
			prg=((i*100)/csv.size())+"";
			if(i==(csv.size()-1)) {
				prg="100";
			}	
			csvDTO.setNUM(csv.get(i)[0]);
			csvDTO.setCODE(csv.get(i)[1]);
			csvDTO.setADDROLD(csv.get(i)[2]);
			csvDTO.setSPECIALCODE(csv.get(i)[3]);
			csvDTO.setSPECIALTYPE(csv.get(i)[4]);
			csvDTO.setADDRNUM(csv.get(i)[5]);
			csvDTO.setSTANDARDYEAR(csv.get(i)[6]);
			csvDTO.setSTANDARDMONTH(csv.get(i)[7]);
			csvDTO.setOFFICIALPRICE(csv.get(i)[8]);
			csvDTO.setOFFICIALDATE(csv.get(i)[9]);
			csvDTO.setDOCUMENT(csv.get(i)[10]);
			csvDTO.setSTANDARDDATA(csv.get(i)[11]);
			
			System.out.println(csv.get(i)[0]+","+csv.get(i)[1]+","+csv.get(i)[2]+","+csv.get(i)[3]+","+csv.get(i)[4]+","+csv.get(i)[5]);
			System.out.println(csvDTO.getNUM()+","+csvDTO.getCODE()+","+csvDTO.getADDROLD()+","+csvDTO.getSPECIALCODE()+","+csvDTO.getSPECIALTYPE());
			
			csvList.add(csvDTO);
			
			if(csvList.size()>1000 || i==(csv.size()-1)) {
				System.out.println("db 입력");
				adminService.addGongsi(csvList);
				csvList=new ArrayList<GongsiDTO>();
			}
		}
		return "success";
	}
	
	
	public static String createCode() {
		return (UUID.randomUUID().toString()).replace("-", "").substring(0, 13);
	}
}
