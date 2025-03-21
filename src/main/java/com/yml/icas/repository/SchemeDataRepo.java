package com.yml.icas.repository;

import com.yml.icas.model.SchemeData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface SchemeDataRepo extends JpaRepository<SchemeData, Integer> {
    @Query("Select s from SchemeData s where s.idText=:idText")
    SchemeData findByIdText(@Param("idText") String idText);

    @Query("Select s from SchemeData s where s.category=:category order by s.id")
    List<SchemeData> getByCategory(@Param("category") String category);

   /* @Query("select new com.yml.icas.dto.HistoryDTO(s.category, s.idText) from SchemeData s ")
    Set<HistoryDTO> getHisCat();*/

    @Query("select s.idText from SchemeData s where s.title !='' and s.category='OPD' order by s.idText")
    List<String> getOPD();

    @Query("select s.idText from SchemeData s where s.title !='' and s.category!='OPD' and (s.idText like('1%') or s.idText like('4%')) order by s.category, s.idText")
    List<String> getSH();

    @Query("select s.idText from SchemeData s where s.title !='' and s.category!='OPD' and s.idText like('3%') order by s.category, s.idText")
    List<String> getPA();

    @Query("select s.idText from SchemeData s where s.title !='' and s.category!='OPD' and s.idText like('5%') order by  s.category, s.idText")
    List<String> getCR();

    @Query("select s.maxAmount from SchemeData s where s.idText=:idText")
    Object getMaxAmount(@Param("idText") String idText);
}
