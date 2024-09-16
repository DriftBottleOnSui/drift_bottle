# Drift Bottle Social Game - Sui Blockchain Edition

- Is there something you've always wanted to say but never found the courage? What are you afraid of? What’s holding you back? Send a drift bottle and release the words that have been weighing on your heart.
- Is there someone you can't stop thinking about, someone you long to speak to but don’t dare? Write your feelings in a drift bottle, and maybe it will find its way to them.
- Has anyone ever told you, "I love you more than anything"?
- Feeling overwhelmed? Need a place to let it all out? Write down the burdens on your heart and send them drifting away.
- Did you know? That year, I waited for you… until the very end. 


## Project Overview
This project is a social game based on the Sui blockchain where users can make new friends by throwing and picking up drift bottles and engage in further conversations. The game combines blockchain technology with the traditional drift bottle concept, providing users with a fun and decentralized social experience. You can try it out at https://drift-bottle.walrus.site.

## Features
- **Throw Drift Bottles**: Users can throw message bottles into the sea, supporting both text and images. All messages are stored on Walrus.
- **Pick Drift Bottles**: Users can pick up drift bottles left by others and read the messages inside.
- **Friends System**: Users can make friends by picking up bottles and later engage in further conversations (currently in development).
- **AI Content Compliance Check**: The game integrates AI functionality to check the compliance of content in drift bottles, preventing messages that contain sensitive topics such as politics, adult content, or violence. This ensures a healthy ecosystem within the game.
- **Walrus Integration**: All static resources of the game are stored on Walrus, ensuring efficient resource management and distribution. For more details, refer to the [Walrus Sites Documentation](https://docs.walrus.site/walrus-sites/intro.html).

## Tech Stack
- **Blockchain**: Sui
- **Frontend**: Vite, NextUI, Tailwind CSS, TypeScript
- **Storage**: Walrus
- **AI Content Compliance Check**

## Installation & Setup

### Clone the Project
```bash
git clone https://github.com/your-repo/drift-bottle.git
```

### Install Dependencies
You can use `npm`, `yarn`, `pnpm`, or `bun` to install dependencies. Here is an example using `npm`:

```bash
npm install
```

### Run the Development Server
```bash
npm run dev
```

### Configure pnpm (optional)
If you're using `pnpm`, you need to add the following code to your `.npmrc` file:

```bash
public-hoist-pattern[]=*@nextui-org/*
```

After modifying the `.npmrc` file, run `pnpm install` again to ensure proper installation of dependencies.

## Smart Contract Interaction
you can clone the smart contract project

```bash
git clone https://github.com/DriftBottleOnSui/drift_bottle.git
```

### Deployment Address
packageId: 0xd0bb9f2fb93d5d750a859758b8c75fcb3416bfc71dc8684912de35cd030912b7

env: testnet