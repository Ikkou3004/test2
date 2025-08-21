package com.quanlyphongtro.repository;

import com.quanlyphongtro.entity.KhachThue;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface KhachThueRepository extends JpaRepository<KhachThue, Integer> {
    boolean existsByCccd(String cccd);
}
