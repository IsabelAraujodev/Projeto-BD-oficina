--inserção de dados

use oficina;

show tables;

insert into Clients (idClient, Name, Address, Phone, Email)
VALUES
    (1, 'João Silva', 'Rua das Flores, 123', '(11) 99999-9999', 'joao.silva@email.com'),
    (2, 'Maria Santos', 'Av. Principal, 456', '(21) 88888-8888', 'maria.santos@email.com'),
    (3, 'Pedro Alves', 'Travessa das Árvores, 789', '(31) 77777-7777', 'pedro.alves@email.com');

insert into Vehicle (Plate, Brand, Model, FabricationYear, Proprietary)
VALUES
    ('ABC1234', 'Chevrolet', 'Onix', 2020, 1),
    ('XYZ5678', 'Ford', 'Ka', 2018, 2),
    ('DEF9999', 'Volkswagen', 'Gol', 2015, 3);

insert into Services (idServices, SDescription, Price)
VALUES
    (1, 'Troca de óleo', 100),
    (2, 'Alinhamento e balanceamento', 150),
    (3, 'Troca de pastilhas de freio', 200),
    (4, 'Revisão geral', 300);

insert into ServiceOrder (Number, OpenDate, ConclusionDate, Vehicle)
VALUES
    (1001, '2023-07-01', '2023-07-05', 'ABC1234'),
    (1002, '2023-07-02', '2023-07-06', 'XYZ5678'),
    (1003, '2023-07-03', NULL, 'DEF9999');

insert into ServiceOrder_Service (ID, ServiceOrder, Service)
VALUES
    (1, 1001, 1),
    (2, 1001, 2),
    (3, 1002, 3),
    (4, 1003, 4);

