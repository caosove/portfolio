package pager;

public class ThePager {
	private int pageNum;
	private int blockSize;
	private int totalPage;
	private String linkUrl;
	
	public ThePager(int pageNum, int blockSize, int totalPage, String linkUrl) {
		super();
		this.pageNum = pageNum;
		this.blockSize = blockSize;
		this.totalPage = totalPage;
		this.linkUrl = linkUrl;
	}

	@Override
	public String toString() {
		int startPage=(pageNum-1)/blockSize*blockSize+1;
		
		int endPage=startPage+blockSize-1;
		if(endPage>totalPage) {
			endPage=totalPage;
		}

		String html="";
		
		if(startPage>0) {		
			html+="<style type='text/css'>";
			html+=".list_number { text-align: center; }";
			html+=".list_n_menu { padding: 3px; margin: 3px; text-align: center; }";
			html+=".list_n_menu a { padding: 5px 8px 4px 8px; margin: 2px; border: 1px solid #000; color: #000; text-decoration: none; }";
			html+=".list_n_menu a:hover { color: orange; }";
			html+=".list_n_menu .current { border: 1px solid #117bff; padding: 5px 8px 4px 8px; font-weight: bold; margin: 2px; color: #036cb4; }";
			html+=".list_n_menu .disabled { border: 1px solid #999; padding: 5px 8px 4px 8px; margin: 2px; color: #999; }";
			html+="</style>";
			html+="<div class='list_number'>";
			html+="<div>";
			html+="<p>";
			html+="<div class='list_n_menu'>";
			if(startPage>blockSize) {
				html+="<a href='"+linkUrl+"pageNum=1'>처음</a>";
				html+="<a href='"+linkUrl+"pageNum="+(startPage-1)+"'>이전</a>";
			} else {
			//	html+="<span class='disabled'>泥섏쓬</span>";
			//	html+="<span class='disabled'>�씠�쟾</span>";
			}
			for(int i=startPage;i<=endPage;i++) {
				if(pageNum==i) {
					html+="<span class='current'>"+i+"</span>";
				} else {
					html+="<a href='"+linkUrl+"pageNum="+i+"'>"+i+"</a>";
				}
			}
			if(endPage!=totalPage) {
				html+="<a href='"+linkUrl+"pageNum="+(startPage+blockSize)+"'>다음</a>";
				html+="<a href='"+linkUrl+"pageNum="+totalPage+"'>마지막</a>";	
			} else {
				//html+="<span class='disabled'>�떎�쓬</span>";
				//html+="<span class='disabled'>留덉�留�</span>";	
			}
			html+="</div>";
			html+="</p>";
			html+="</div>";
			html+="</div>";
		}
		return html;
	}
}