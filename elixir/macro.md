defmacro gen_function(fun_name) do
  quote do 
    def unquote(:"#{fun_name}")() do
      # your code...
    end
  end
end
