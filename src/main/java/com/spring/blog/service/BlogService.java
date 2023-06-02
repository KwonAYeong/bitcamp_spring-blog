package com.spring.blog.service;

import com.spring.blog.entity.Blog;

import java.util.List;

public interface BlogService {

    // 비즈니스 로직을 담당할 메서드를 "정의"만 하면 됩니다.
    // 전체 블로그 포스팅을 조회하는 findAll() 선언.
    List<Blog> findAll();

    // 단일 포스팅을 조회하는 메서드 findById()를 선언해주세요.
    Blog findByID(long blogId);

    // 단일 포스팅을 삭제하는 메서드 deleteById()를 선언해주세요.
    void deleteByID(long blogId);

    // 단일 포스팅을 게시하는 메서드 save()를 선언해주세요.
    void save(Blog blog);

    // 특정 포스팅을 수정하는 메서드 update()
    void update(Blog blog);

}