package com.met.shop.controller;

import com.met.shop.domain.Article;
import com.met.shop.form.ArticleFilterForm;
import com.met.shop.service.ArticleService;
import com.met.shop.type.SortFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;

@RestController
public class StoreController {
	
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping(value = "/store", method = RequestMethod.POST)
	public ResponseEntity<Page<Article>> store(@RequestBody ArticleFilterForm filters) {
		Integer page = filters.getPage();			
		int pagenumber = (page == null ||  page <= 0) ? 0 : page-1;
		SortFilter sortFilter = new SortFilter(filters.getSort());
		Page<Article> pageresult = articleService.findArticlesByCriteria(PageRequest.of(pagenumber,9, sortFilter.getSortType()),
																filters.getPricelow(), filters.getPricehigh(), 
																filters.getSize(), filters.getCategory(), filters.getBrand(), filters.getSearch());	

		return ResponseEntity.ok(pageresult);
	}
	
	
	@RequestMapping("/article-detail/{id}")
	public ResponseEntity<Article> articleDetail(@PathVariable("id") Long id) {
		Article article = articleService.findArticleById(id);
		return ResponseEntity.ok(article);
	}
	

}
