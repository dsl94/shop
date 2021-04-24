package com.met.shop.service.impl;

import com.met.shop.domain.Article;
import com.met.shop.repository.ArticleRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(MockitoExtension.class)
class ArticleServiceImplTest {

    @Mock
    private ArticleRepository articleRepository;

    @InjectMocks
    private ArticleServiceImpl articleService;

    @Test
    public void testFindAll() {
        List<Article> expected = new ArrayList<>(Arrays.asList(new Article(), new Article()));

        Mockito.when(articleRepository.findAllEagerBy()).thenReturn(expected);

        List<Article> actual = articleService.findAllArticles();

        assertEquals(expected, actual);
    }

    @Test
    public void testSaveArticle() {
        Article article = new Article();
        article.setId(1L);

        articleService.saveArticle(article);

        Mockito.verify(articleRepository, Mockito.times(1)).save(article);
    }

    @Test
    public void testDeleteById() {
        articleService.deleteArticleById(1L);

        Mockito.verify(articleRepository, Mockito.times(1)).deleteById(1L);
    }

    @Test
    public void testGetAllSizes() {
        List<String> expected = Arrays.asList("M", "L", "XL");

        Mockito.when(articleRepository.findAllSizes()).thenReturn(expected);

        List<String> actual = articleService.getAllSizes();

        assertEquals(expected, actual);
    }

    @Test
    public void testGetAllBrands() {
        List<String> expected = Arrays.asList("Nike", "Adidas", "Puma");

        Mockito.when(articleRepository.findAllBrands()).thenReturn(expected);

        List<String> actual = articleService.getAllBrands();

        assertEquals(expected, actual);
    }

    @Test
    public void testGetAllCategories() {
        List<String> expected = Arrays.asList("Shirts", "Shoes", "Pants");

        Mockito.when(articleRepository.findAllBrands()).thenReturn(expected);

        List<String> actual = articleService.getAllBrands();

        assertEquals(expected, actual);
    }
}