package com.met.shop.controller;

import com.met.shop.domain.*;
import com.met.shop.dto.CreateArticleDto;
import com.met.shop.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("/article")
public class  ArticleController {

	@Autowired
	private ArticleService articleService;
	
	@RequestMapping(value="/add", method= RequestMethod.POST)
	public ResponseEntity<?> addArticlePost(@RequestBody CreateArticleDto articleDto) {
		Article newArticle = new ArticleBuilder()
				.withTitle(articleDto.getArticle().getTitle())
				.stockAvailable(articleDto.getArticle().getStock())
				.withPrice(articleDto.getArticle().getPrice())
				.imageLink(articleDto.getArticle().getPicture())
				.sizesAvailable(Arrays.asList(articleDto.getSize().split("\\s*,\\s*")))
				.ofCategories(Arrays.asList(articleDto.getSize().split("\\s*,\\s*")))
				.ofBrand(Arrays.asList(articleDto.getSize().split("\\s*,\\s*")))
				.build();		
		articleService.saveArticle(newArticle);	
		return ResponseEntity.ok().build();
	}
	
	@RequestMapping("/article-list")
	public ResponseEntity<List<Article>> articleList(Model model) {
		List<Article> articles = articleService.findAllArticles();
		return ResponseEntity.ok(articles);
	}
	
	@RequestMapping("/info/{id}")
	public ResponseEntity<Article> info(@PathVariable("id") Long id) {
		Article article = articleService.findArticleById(id);
		return ResponseEntity.ok(article);
	}
	
	@RequestMapping(value="/edit/{id}", method= RequestMethod.PUT)
	public ResponseEntity<?> editArticlePost(@PathVariable("id") Long id, @RequestBody CreateArticleDto articleDto) {
		Article newArticle = new ArticleBuilder()
				.withTitle(articleDto.getArticle().getTitle())
				.stockAvailable(articleDto.getArticle().getStock())
				.withPrice(articleDto.getArticle().getPrice())
				.imageLink(articleDto.getArticle().getPicture())
				.sizesAvailable(Arrays.asList(articleDto.getSize().split("\\s*,\\s*")))
				.ofCategories(Arrays.asList(articleDto.getSize().split("\\s*,\\s*")))
				.ofBrand(Arrays.asList(articleDto.getSize().split("\\s*,\\s*")))
				.build();
		newArticle.setId(id);
		articleService.saveArticle(newArticle);	
		return ResponseEntity.ok().build();
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<?> deleteArticle(@PathVariable("id") Long id) {
		articleService.deleteArticleById(id);
		return ResponseEntity.ok().build();
	}
	
}
