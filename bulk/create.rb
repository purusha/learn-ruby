a = require 'mysql'
puts "load mysql module ? ... #{a}"

con = Mysql.new('localhost', 'root', 'root', 'bulk')

# temp_table_ddl = <<-eo_temp_table_ddl
  # CREATE TABLE A (
    # pk_id int(11) not null,
    # selection_id int(11) not null,
    # recipient varchar(255) not null,
    # selezionati tinyint(1) not null,
    # pianificati tinyint(1) not null,
    # duplicati tinyint(1) not null,
    # pianificati_duplicati tinyint(1) not null,
    # blacklistati tinyint(1) not null,
    # INDEX pk_id (pk_id),        
    # INDEX recipient (recipient)
  # );
# eo_temp_table_ddl
# 
# rs = con.query(temp_table_ddl)

temp_table_ddl = <<-eo_temp_table_ddl
  CREATE TABLE B (
    pk_id int(11) not null,
    selection_id int(11) not null,
    recipient varchar(255) not null,
    selezionati tinyint(1) not null,
    pianificati tinyint(1) not null,
    duplicati tinyint(1) not null,
    pianificati_duplicati tinyint(1) not null,
    blacklistati tinyint(1) not null
  );
eo_temp_table_ddl

rs = con.query(temp_table_ddl)

index_ddl = <<-eo_index_ddl
  ALTER TABLE B
    ADD INDEX pk_id (pk_id),
    ADD INDEX recipient (recipient)
eo_index_ddl

rs = con.query(index_ddl)
