function bool = dump(motor,speed,b)
	if(b==true)
		rotateDist(motor,30,speed,false);
	else
		rotateDist(motor,30,speed*-1,false);
	end
	bool=true;
end
