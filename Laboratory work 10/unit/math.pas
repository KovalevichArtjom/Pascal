unit math;

interface
  function Sec(val:real):real;
  
implementation
  function Sec(val:real):real;
  begin
    sec:= 1 / cos(val);
  end;
end.  