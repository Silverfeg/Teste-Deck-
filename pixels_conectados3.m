function[pixels_conectados,imagem_out]=pixels_conectados3(imagem,lin,col,cor)
%fun��o para achar todos os pixels pretos ou brancos conectados.
%cor=0: achar pixels pretos.
%cor=1: achar pixels brancos.

s1=size(imagem);

pixels_conectados=[];

%armazena o 1� pixel preto ou branco, dado como par�metro para a fun��o:
pixels_conectados(1,1)=lin;
pixels_conectados(2,1)=col;

imagem(lin,col)=~cor; %apaga o pixel dado como par�metro.

pos=2; %posi��o dentro da matriz.
%o 1� pixel � o que foi dado como par�metro, ent�o o pr�ximo ir� para a posi��o 2.

a=1; %referente ao pixel cuja vizinhan�a est� sendo verificada.

while(a<pos) %quando a=pos ter�o acabado os pixels conectados.
    
    i=pixels_conectados(1,a);
    j=pixels_conectados(2,a);
    
    %considerando o tipo de vizinhan�a N8:
    
    %esquerda
    if(j>1) %tais "ifs" s�o feitos para n�o ter o problema da borda.
        if(imagem(i,j-1)==cor)
            pixels_conectados(1,pos)=i;
            pixels_conectados(2,pos)=j-1;
            pos=pos+1;
            imagem(i,j-1)=~cor;
        end
    end
    %cima
    if(i>1)
        if(imagem(i-1,j)==cor)
            pixels_conectados(1,pos)=i-1;
            pixels_conectados(2,pos)=j;
            pos=pos+1;
            imagem(i-1,j)=~cor;
        end
    end
    %direita
    if(j<s1(2))
        if(imagem(i,j+1)==cor)
            pixels_conectados(1,pos)=i;
            pixels_conectados(2,pos)=j+1;
            pos=pos+1;
            imagem(i,j+1)=~cor;
        end
    end
    %baixo
    if(i<s1(1))
        if(imagem(i+1,j)==cor)
            pixels_conectados(1,pos)=i+1;
            pixels_conectados(2,pos)=j;
            pos=pos+1;
            imagem(i+1,j)=~cor;
        end
    end
    %cima esq
    if((i>1)&&(j>1))
        if(imagem(i-1,j-1)==cor)
            pixels_conectados(1,pos)=i-1;
            pixels_conectados(2,pos)=j-1;
            pos=pos+1;
            imagem(i-1,j-1)=~cor;
        end
    end
    %cima dir
    if((i>1)&&(j<s1(2)))
        if(imagem(i-1,j+1)==cor)
            pixels_conectados(1,pos)=i-1;
            pixels_conectados(2,pos)=j+1;
            pos=pos+1;
            imagem(i-1,j+1)=~cor;
        end
    end
    %baixo esq
    if((i<s1(1))&&(j>1))
        if(imagem(i+1,j-1)==cor)
            pixels_conectados(1,pos)=i+1;
            pixels_conectados(2,pos)=j-1;
            pos=pos+1;
            imagem(i+1,j-1)=~cor;
        end
    end
    %baixo dir
    if((i<s1(1))&&(j<s1(2)))
        if(imagem(i+1,j+1)==cor)
            pixels_conectados(1,pos)=i+1;
            pixels_conectados(2,pos)=j+1;
            pos=pos+1;
            imagem(i+1,j+1)=~cor;
        end
    end
    a=a+1;
end
imagem_out=imagem;
end

           