package com.action.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.CrawlingDTO;

public class CrawlingSearchListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String param = request.getParameter("param").trim();
		String url = "";
		ArrayList<CrawlingDTO> list = new ArrayList<>();
		
		if(param.equals("google")) {
			url = "https://www.google.com/search?q=호캉스+다녀왔어요&sxsrf=APwXEdcHyWz6UYRAIUKHKLjLS0tJAQvMqw:1680850484717&source=lnms&tbm=vid&sa=X&ved=2ahUKEwiNl7-AmJf-AhXUP3AKHcv5CiQQ_AUoA3oECAEQBQ&biw=960&bih=754&dpr=1.25";
			
			try {
				Connection con = Jsoup.connect(url);
				Document doc = con.get();
				
				Elements cont = doc.getElementsByClass("MjjYud");
				
				for(Element e : cont) {
					
					Elements t = e.select("h3.LC20lb");
					Elements c = e.select(".Uroaid");
					Elements w = e.select(".P7xzyf");
					String i = e.select(".VYkpsb").attr("data-url");
					
					String link = e.select(".DhN8Cf > a").attr("href");
					
					StringTokenizer st = new StringTokenizer(w.text(), "·");
					st.nextToken();
					String wri = st.nextToken();
					
					CrawlingDTO dto = new CrawlingDTO();
					dto.setTitle(t.text());
					dto.setLink(link);
					dto.setWriter(wri);;
					dto.setContent(c.text());
					dto.setImg(i);
					
					list.add(dto);
				}
				request.setAttribute("Check", "1");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
		}else if(param.equals("naver")) {
			url = "https://search.naver.com/search.naver?where=influencer&sm=tab_jum&query=호텔+리뷰";
			
			try {
				
				Connection con = Jsoup.connect(url);
				Document doc = con.get();
				
				Elements cont = doc.getElementsByClass("keyword_bx _item _check_visible");
				
				for(Element e : cont) {
					
					Elements t = e.select(".name_link");
					Elements c = e.select(".dsc_link");
					Elements w = e.select(".txt");
					String imgsrc = e.select("._foryou_image_source").attr("data-lazysrc");
					
					String link = t.attr("href");
					
					CrawlingDTO dto = new CrawlingDTO();
					dto.setTitle(t.text());
					dto.setLink(link);
					dto.setWriter(w.text());;
					dto.setContent(c.text());
					dto.setImg(imgsrc);
					list.add(dto);
				}
				
				request.setAttribute("Check", "2");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}else if(param.equals("nate")) {
			url = "https://search.daum.net/nate?nil_suggest=btn&w=tot&DA=SBC&q=가족끼리호텔다녀왔어요";
			
			try {
				Connection con = Jsoup.connect(url);
				Document doc = con.get();
				
				Elements cont = doc.getElementsByTag("c-card");
				
				for(Element e : cont) {
					
					Elements t = e.select("c-menu-share");
					Elements c = e.select("c-contents-desc");
					Elements w = e.select("c-frag");
					String imgsrc = t.attr("data-image");
					String link =  t.attr("data-link");
					if(t.attr("data-title")=="")break;
					CrawlingDTO dto = new CrawlingDTO();
					String wt = w.text();
					dto.setTitle(t.attr("data-title"));
					dto.setLink(link);
					dto.setWriter(wt.substring(15, wt.length()-11));;
					dto.setContent(c.text());
					dto.setImg(imgsrc);
					list.add(dto);
				}
				request.setAttribute("Check", "3");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			//오류
		}
		
		request.setAttribute("List", list);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("crawling/crawling_main.jsp");
		return forward;
	}
}