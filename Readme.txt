
---------------------------------------------SQL Scripts------------------------------------------------------------------------------
There are three scripts to acquire the SNOMED CT data base in total.
The first one is named as 'creat_tables.sql'. This file helps import the SNOMED CT file.
The second one is named as 'process_tables.sql'. After we import the SNOMED CT release file, we have to process the tables.
We only need up-to-date data. Therefore, we can get a concept output table, a description output table, a relationship output table,
a map snapshot output table, and a language set output table.
The third file is named as 'loop_find_children.sql'. After we derive the relationship output table, we can find all of the children of clinical
finds (404684003),  situation (243796009), Exposure to potentially harmful entity (444071008) and Exposure to communicable disease(444107005).
The fourth file is named as 'final_output.sql'. This file generates the final output of SNOMED CT database.


As for finding the attribute output,  the 'attribute_output.sql' works under the some logic above.


--------------------------------------------Python Scripts----------------------------------------------------------------
These codes are used to create EDG masterfile.
