function bool = dump(motor,speed,b)
	if(b==true)
		rotateDist(motor,30,speed,false);
		pause(.2);
		rotateDist(motor,30,speed*-1,false);
	else
		rotateDist(motor,30,speed*-1,false);
		pause(.2);
		rotateDist(motor,30,speed,false);
	end
	bool=true;
end
