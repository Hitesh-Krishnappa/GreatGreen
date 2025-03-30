# GreatGreen
Final Project for INFO 6150

Great-Green is a pioneering web application designed to address the critical challenges of desertification, particularly in desert belts like the Sahel, through innovative reforestation and sustainable land management efforts. This platform not only focuses on planting trees but also introduces a unique model of engaging users in growing diverse crops, plants, and flowers. By integrating technology with environmental stewardship, Great-Green seeks to empower communities, foster biodiversity, and promote a sustainable model of ecological restoration.

##### Note: Skip to last for setup instructions, Check PDF for presentation (Stylings are retained)

# Background

The Sahara, once a more hospitable region, has undergone significant climatic changes over time. Over the past century, the Sahara has been expanding at an alarming rate, with desertification occurring at a pace of approximately 10% per decade. This phenomenon negatively impacts drylands, rendering the soil less productive over time. Along the southern border of the Sahara lies the Sahel region, characterized by semi-arid conditions. The Sahel acts as a transition zone between the Sahara and the southern Sudanian savanna, providing grasslands and savannas vital for local ecosystems.

However, the Sahel has experienced a significant decrease in rainfall compared to the first half of the 20th century. Climate change further compounds this issue, contributing to desertification and escalating conflicts between local communities. This deterioration of environmental conditions necessitates urgent action to prevent further degradation.

In response to these challenges, the Great Green Wall initiative was launched with the ambitious goal of restoring 100 million hectares of land across Africa by 2030. This initiative aims to create a continuous green belt stretching from Senegal in the west to Djibouti in the east, spanning 11 countries. By partnering with a total of 21 countries, the initiative seeks to mobilize collective action to combat desertification and promote sustainable land management practices.

The Great Green Wall initiative focuses on planting the right type of vegetation, including trees, bushes, and grasses, to restore degraded landscapes and improve ecosystem resilience. Importantly, the initiative emphasizes the involvement of local communities, allowing them to benefit from and actively participate in restoration efforts.

However, despite these efforts, only 4% of the target has been completed thus far, highlighting the need for accelerated action. Overcoming obstacles such as funding constraints and promoting diversified farming practices are essential for the success of the Great Green Wall initiative and the long-term sustainability of the Sahara and Sahel regions.

# Features
1. Plant Growth Tracking & Sharing
2. Grow and Contribute: Users interested in growing plants can select from a variety of seeds based on their difficulty level. They receive detailed instructions for nurturing the plants and are encouraged to share progress through weekly updates.
3. Seed Sharing Initiative
4. Sustain and Multiply: Once plants yield crops or seeds, users are encouraged to send back 20% of their yield to Great-Green or designated UN programs. This unique cycle helps sustain the project and expand reforestation efforts.
5. Interactive Mapping
6. Visualize and Engage: Users can explore interactive maps to see affected areas, ongoing projects, and identify zones needing attention. They can manage reforestation projects with comprehensive tools, tracking progress and evaluating impact.
7. Connect and Learn: The platform encourages community interaction for knowledge exchange and collaboration. It offers a rich library of materials to educate on desertification, its effects, and mitigation strategies.
8. Plant Recovery Support: Community Engagement & Educational Resources are available for providing support to struggling plants with issues or pests. Experts will be consulted when requested on as need basis.

# Goals
* Enhance Ecological Restoration: To increase rehabilitated lands and introduce a sustainable cycle of plant growth and sharing.
* Empower Communities: Equip local and global users with knowledge and resources to actively participate in combating desertification.
* Promote Biodiversity: Focus on indigenous and diverse species to enrich local ecosystems.
* Contribute to Climate Action: Leverage reforestation and sustainable agriculture to sequester carbon and combat climate change.
  
# How It Works
* Seed Selection: Users choose seeds based on their planting experience and receive detailed cultivation instructions.
* Progress Sharing: Users upload photos of their plants at weekly intervals, sharing their journey with the community.
* Yield Sharing: Upon harvest, users contribute 20% of their seeds or crops back to the project or partner organizations, helping to perpetuate the cycle of growth and support further reforestation projects.

## Design
![HighLevelCompleteUserFlow](/docs/User%20Flow%20High%20Level.jpeg)
![CompleteUserFlow](/docs/User%20Flow%20-%20In%20Depth.jpeg)
![How it works](/docs/How%20it%20works.png)

  
# Technology Stack
* Interactive UI: React.js for an engaging frontend.
* Efficient Backend: Node.js with Express for server-side logic.
* Scalable Data Storage: MongoDB for data management.
* Geographic Visualizations: Integration with Leaflet map.
  
# Contributing
Great-Green invites contributions from a diverse range of individuals and organizations. Whether it's through coding, educating, or gardening, your participation can help drive global change. See our contributing guidelines for more details.

# License
Great-Green is open-source, available under the MIT License, promoting free and collaborative development and distribution.

# Join the Movement
Be a part of Great-Green's mission to transform desertified lands into thriving ecosystems. Your involvement can lead to a greener planet and a more sustainable future.


# GreatGreen Object Model

```mermaid
classDiagram
  class User {
    + String name
    + String password
    + String email
    + String mobile
    + String location
  }
  class Instruction {
    + int id
    + String title
    + String descrption
    + String resources
  }

  class Level {
    + int id
    + String name 
  }

  class Plant {
    + int id
    + String name
    + boolean yieldable
    + Enum unit
  }

  class SaplingKit {
    + int id
    + String name
    + Enum type
    + Level level
    + Instruction preperation_instruction
    + Instruction journey_instruction
    + Plant plant
  }

  class Journey {
    + int id
    + User user
    + Enum provider_type
    + SaplingKit kit_id
    + int quantity
    + Enum status
    + int provider_id
    + Level level
  }

  class Milestone {
    + int id
    + String url
    + String comment
    + Date created_on
    + Journey journey
  }
  class Contribution {
    + int id
    + Journey journey
    + Enum status
    + int value
  }

  class Center {
    + int id
    + int location
    + String address
    + String name
  }

  class Affiliation {
    + int id
    + User user
    + Journey journey
    + Enum status
  }

  class Badge {
    + int id
    + String name
    + String logo
  }

  class UserBadges {
    + int id
    + User user
    + Badge badge
    + Date achieved_on
  }
  class KitExtras {
    + int id
    + String name
    + enum type
  }




  Center "1"<|--"*" Affiliation
  Instruction "2"o--"1" SaplingKit
  KitExtras "0..n"o--"1" SaplingKit
  Plant "1"*--"0..n" SaplingKit
  Level "1"o--"0..n" SaplingKit
  SaplingKit "1"*--"0..n" Journey
  User "1"*--"0..n" Journey
  Level "1" o-- "*"Journey
  Journey "1"*--"*" Milestone 
  Journey "1"*--"1" Contribution 
  Journey "1"*--"*" Affiliation
  User "1"*--"0..n" UserBadges
  Badge "1"*--"*" UserBadges


## Screenshots
![Login](/docs/snapshots/login.png)

#### More screenshots in docs/snapshots folder


## Pre-Requisites & Dependencies
- Node v21.7.3
- npm 10.5.0
- Mongo DB

## API setup instructions
- `cd service`
- `sh setup.sh`

## UI setup instructions
- `cd app`
- `npm i` installs all vite related packages
- `cd great-green`
- `npm i` installs all the UI dependent packages
- `npm run dev` Runs application in dev mode
- Change the HOST_URL in api.ts file to point to different server

## Project Guide
- The docs folder has all the documentation from UML to the API docs for the application
- The files for the frontend app is present in app folder
- The files for the backend is in service folder
- The API has multiple base routes:
  - auth for authentication endpoints - User Registration, User information, Login
  - admin for Administrative endpoints - Administrative to add data to the endpoints ( Covers future use cases with inventory for the UN centers and management endpoint for support)
  The remaining are end user endpoints which allow user to interact with the application

- The user interface currently allows users to manage their journeys and contribute as well. The backend has more capabilities and functionalities.

# Team Members
- Hitesh Krishnappa
- Bhargav Chickmagalur Nanjundappa

## Further Reading
- [Desertification and Climate Change](https://www.ipcc.ch/srccl/chapter/chapter-3/)
- [Green Wall of India](https://www.youtube.com/watch?v=pVjnuMQ0YmY)