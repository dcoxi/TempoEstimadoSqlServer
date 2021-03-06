CREATE FUNCTION [dbo].[TempoEstimado] 
 (@DataInicio datetime
,@dataFim    datetime
)
RETURNS VARCHAR(20)
 As 
 Begin
    --Calcul
 declare @tempo  varchar(20) = null
 declare @temporestante varchar(20) = null 

--Calcular Meses --
   set @tempo = (Select DATEDIFF(MONTH, @dataInicio,@dataFim))
   IF (@tempo <= 0)
   Begin
       --set @temporestante = '0 Meses';

	-- Calcular Semanas --
	set @tempo = (select (datediff(ww,@dataInicio,@dataFim))) 

	IF ((@tempo <= 0))
	Begin
	

   -- Calcular Dias --
	   set @tempo = (select   DATEDIFF(DAY, @dataInicio, @dataFim))

	  IF (@tempo <= 0)
      Begin
	        set @temporestante = '0 Dia(s)';
      End
	  Else
	  Begin
	        set @temporestante = @tempo + ' Dia(s)';
	  End


	End
	Else
	Begin
	        set @temporestante = @tempo + ' Semana(s)';
	End


   End
   Else
   Begin 
       set @temporestante = @tempo + ' Mese(s)';
   End

   return @temporestante
	   
  END
