erDiagram
NEIGHBORHOOD ||--|{ BAR : "contains"
BAR ||--|{ MENU : "offers"
BEER ||--|{ MENU : "is listed in"

    NEIGHBORHOOD {
        int id PK
        string name
    }

    BAR {
        int id PK
        string name
        string address
        int neighborhood_id FK
    }

    BEER {
        int id PK
        string name
        string type
        float abv
    }

    MENU {
        int bar_id PK, FK
        int beer_id PK, FK
        float price
    }