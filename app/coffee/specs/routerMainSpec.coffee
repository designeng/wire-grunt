# routerMainSpec
define
    $plugins: [
        "wire/debug"
        "wire/dom"
        "core/plugin/contextRouter"
    ]

    appRouter:
        contextRouter: 
            routes:
                "autocomplete"  :   
                    spec: "components/autocomplete/spec"
                    slot: {$ref: "dom.first!#page"}
                "calendar"  :  
                    spec: "components/calendar/spec"
                    slot: {$ref: "dom.first!#page"}
