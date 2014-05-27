package com.mkyong.customer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.params.ModifiableSolrParams;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.model.SolrReObject;
import com.vo.VOSolrSearch;

/**
 * @author xhj_create
 * @Date   2014-5-22 上午10:44:17
 */
public class SolrjController extends SimpleFormController {
	private HttpSolrServer httpSolrServer;

	public SolrjController() {
		setCommandClass(VOSolrSearch.class);
		setCommandName("solrSearch");
	}
	
	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		return null;
	}
	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		
		Map<String, Object> model = new HashMap<String, Object>();
		List<SolrReObject> re_list = new ArrayList<SolrReObject>();
		
		VOSolrSearch solrSearch = (VOSolrSearch)command;
		String query;
		query = solrSearch.getQuery();
		query = query.equals("")?"*:*":query;
		
		System.out.println(query);
		
		
		int rows;
		int start_page;
		try {
			start_page = (new Integer(solrSearch.getStart_page())).intValue();
			rows = (new Integer(solrSearch.getRows())).intValue();
		} catch (Exception e) {
			start_page = 10;
			rows = 10;
		}
		
		//solr查询
		ModifiableSolrParams params = new ModifiableSolrParams();
		params.add("q", solrSearch.getQuery());
		
		params.add("start",new Integer(start_page).toString());
		params.add("rows", new Integer(rows).toString());
		params.add("indent", "true");
		params.add("wt", "json");
		
		
        QueryResponse rsp = httpSolrServer.query(params);
        SolrDocumentList solrDocumentList = rsp.getResults();
        
        int all_len = (int) solrDocumentList.getNumFound();
       
        System.out.println("返回条目： " + all_len);
        for(int i=0;i<rows && i<all_len;i++){
        	SolrDocument document = solrDocumentList.get(i);
        	/*
        	Iterator<Map.Entry<String, Object>> it = document.iterator();
        	while(it.hasNext()){
        		//System.out.println(it.next().getValue());
        	}
        	*/
        	SolrReObject resultObject = new SolrReObject();
        	resultObject.setId(new Integer(i).toString());
        	resultObject.setContent((String) document.get("content"));
        	resultObject.setTitle((String) document.get("title"));
        	resultObject.setUrl((String) document.get("url"));
        	
        	re_list.add(resultObject);
        }
		
        model.put("re_list", re_list);
		
		return new ModelAndView("solrShow",model);
	}
	
	
	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		return new VOSolrSearch();
	}

	public HttpSolrServer getHttpSolrServer() {
		return httpSolrServer;
	}

	public void setHttpSolrServer(HttpSolrServer httpSolrServer) {
		this.httpSolrServer = httpSolrServer;
	}
}
