create database oficina;
use oficina;

--criar tabela de clientes
create table Clients(
    idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    Email varchar(255) default 0,
    Phone varchar(11),
    CPF char(11) not null,
    Address varchar(30),
    constraint unique_cpf_client unique (CPF)
);
--criar tabela de serviços
create table services(
    idServices int auto_increment primary key,
    Sname varchar(10) not null,
    SDescription varchar(500) not null,
    avaliacao float default 0,
    Price DECIMAL(10, 2),
    constraint unique_cpf_client unique (CPF)
);
--criar tabela de veículo
create table Vehicle (
    Plate varchar(10) primary key,
    Brand varchar(50),
    Model varchar(50),
    ManufactureYear int,
    Proprietary int,
    foreign key (Proprietary) references client(idClient),
);
--criar tabela de pagamento
create table payments(
    idclient int primary key,
    idPayment int,
    typePayment enum('Boleto', 'Cartão', 'Dois cartões'),
    limitAvailable float,
    primary key(idClient, id_payment)
);
--criar tabela de ordem de serviço
create table ServiceOrder (
    Number int primary key,
    OpenDate date,
    ConclusionDate date,
    Vehicle varchar(10),
    foreign key (Vehicle) references Vehicle(Plate)
);

create table ServiceOrder_Service (
    ID int primary key,
    ServiceOrder int,
    Service int,
    foreign key (ServiceOrder) references ServiceOrder(Number),
    foreign key (Services) references Services(ID)
);

-- Recuperar todos os clientes da oficina
select * from Clients;

-- Recuperar todos os serviços disponíveis
select * from Services;

-- Recuperar informações de um veículo específico pela placa
select * from Vehicle where Plate = 'ABC1234';

-- Recuperar todas as ordens de serviço concluídas após uma determinada data
select * from ServiceOrder where ConclusionDate > '2023-01-01';

-- Recuperar os clientes e seus veículos, mostrando a idade aproximada do veículo
select c.Name, v.Brand, v.Model, (year(now()) - v.FabricationYear) as VehicleAge
from Client c
join Vehicle v on c.ID = v.Proprietary;

-- Recuperar os serviços em ordem crescente de valor
select * from Services order by Price asc;

-- Recuperar os veículos em ordem decrescente de ano de fabricação
select * from Vehicle order by FabricationYear desc;

-- Recuperar os serviços com valor médio acima de R$ 100
select AVG(Price) as MiddleValue, Description
from Services
group by Description
having AVG(Price) > 100;

-- Recuperar as informações de uma ordem de serviço, incluindo o cliente, veículo e serviços associados
select os.Number, c.Name as Client, v.Brand, v.Model, s.Description as Services
from ServiceOrder os
join Vehicle v on os.Vehicle = v.Plate
join Client c on v.Proprietary = c.ID
join ServiceOrder_Service oss on os.Number = oss.ServiceOrder
join Services s on oss.Services = s.ID
where os.Number = 1001;







