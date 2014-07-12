Controllers, misc
=================

## Home

    bin/rails g controller Home index

## Nack

    bin/rails g controller Acknowledges index

Models
======

## Site

    bin/rails g scaffold Site name:string connection_type:string uri:string

## Service

    bin/rails g scaffold Service site:string:index host:string:index \
                service_description:string:index

