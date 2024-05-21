using { sap.capire.incidents as my } from '../db/schema';

service ProcessorService { 
    entity Incidents as projection on my.Incidents;

    @readonly
    entity Customers as projection on my.Customers;
}

annotate ProcessorService.Incidents with @odata.draft.enabled; 
// habilita la creación de nuevos atributos y la seccion de borrar y
// editar
annotate ProcessorService with @(requires: 'support');

//un usuario con rol de soporte puede ver y cambiar los incidentes y los clientes.
extend projection ProcessorService.Customers with {
  firstName || ' ' || lastName as name: String
}
