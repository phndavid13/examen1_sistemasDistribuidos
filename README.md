<h1><b>Aprovisionamiento de un ambiente virtual</b></h1>

En el siguiente repositorio se pueden encontrar los archivos necesarios para aprovisionar dos máquinas virtuales, una con un servicio en NodeJS y otra con una base de datos Postresql. Para esto se usan las herramientas Vagrant y Chef. 

Nota: recomendado probar en plataformas Linux (preferiblemente Ubuntu).

Para usar este repositorio: 

1. Configure una interfaz virtual para que el host se comunique con las máquinas virtuales. Use el comando sudo ifconfig eth4(o la que esté usando en su red):0 192.168.131.69
2. use el comando git clone https://github.com/santidelosrios/examen1_sistemasDistribuidos.git para obtener los archivos necesarios. 
3. vagrant up para iniciar el aprovisionamiento.
4. ingrese al navegador y digite la dirección 192.168.131.61:8090
5. Para visualizar la información de la base de datos, ingrese la uri 192.168.131.61:8090/db.

<h2><b>Contrato de API REST</b></h2>
