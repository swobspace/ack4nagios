Controllers, misc
=================

## Home

    bin/rails g controller Home index

## Nack

    bin/rails g controller Acknowledges index

Models
======

## Site

    bin/rails g scaffold Site name:string connection_type:string uri:string \
                otrs_queue:references nagios_service_url:string

    # bin/rails g migration AddOtrsQueueIdToSite otrs_queue:references
    # bin/rails g migration AddNagiosServiceUrlToSite nagios_service_url:string

## Service

    bin/rails g scaffold Service site:string:index host:string:index \
                service_description:string:index

Jobs
====

    bin/rails g job create_service_mails
    bin/rails g job create_merged_services_mail

Mailer
=====

    bin/rails g mailer ServiceMail

