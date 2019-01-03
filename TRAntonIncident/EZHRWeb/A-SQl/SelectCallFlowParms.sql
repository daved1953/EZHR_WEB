
 create procedure SelectCallFlowParms
 
  as 


     select  [Action]
      ,[Section]
      ,[Verbage]
      ,[Sectiontype]
      ,[QuestionType]
      ,[PrimarySection]
      ,[SubSection] from samplecallflow 
	   order by ID

 go
