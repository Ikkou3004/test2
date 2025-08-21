package com.quanlyphongtro.service;

import com.quanlyphongtro.entity.KhachThue;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface KhachThueService {
    List<KhachThue> findAll();
    Page<KhachThue> findAll(Pageable pageable);
    Optional<KhachThue> findById(Integer id);
    KhachThue save(KhachThue kt);
    void deleteById(Integer id);
    boolean existsByCccd(String cccd);
}
