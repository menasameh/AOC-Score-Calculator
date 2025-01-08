# AOC Command-Line JSON Parser

This command-line application is designed to parse JSON data from a file representing Advent of Code leaderboard information. The app reads a file path as an input parameter, decodes the JSON data, and displays relevant information about valid members while skipping invalid entries.

---

## Features

- Parses a JSON file containing Advent of Code leaderboard data.
- Skips invalid members (e.g., members with missing or invalid fields like `name`).
- Logs errors for invalid entries for debugging purposes.

---

## JSON File Structure

The app expects the input JSON file to have the following structure:

```json
{
  "day1_ts": 1733029200,
  "owner_id": 2255979,
  "members": {
    "106249": {
      "id": 106249,
      "name": "some name",
      "stars": 0,
      "last_star_ts": 0,
      ...
    },
    "249018": {
      "id": 249018,
      "name": "other name",
      "stars": 29,
      "last_star_ts": 1734257777,
      ...
    },
    ...
  },
  "event": "2024"
}
```
- **`members`**: A dictionary of members, where each key is a string (ID) and the value is a member object.

---

## Installation

### Build the app

1. Clone the repository:
   ```bash
   git clone https://github.com/menasameh/AOC-Score-Calculator.git
   cd AOC-Score-Calculator
   ```

2. Build the project using Swift:
   ```bash
   swift build
   ```

### Use the latest release 

   1. downlaod the latest executable from [here](https://github.com/menasameh/AOC-Score-Calculator/releases)

---

## Usage

1. **Run the application**:
   ```bash
   ./AOC_score /path/to/aoc2024.json
   ```
   Replace `/path/to/aoc2024.json` with the full path to your JSON file.

2. **Output Example**:
   ```
   Name: winner#1 - Stars:50 - lastStar: 1735121795
   Name: winner#2 - Stars:49 - lastStar: 1735126484
   Name: winner#3 - Stars:49 - lastStar: 1735137590
   ```

---

## Error Handling

- If a member has invalid or missing fields (e.g., `name` is `null`).

---

## Development Notes

### Key Structs

1. **`AocDTO`**
   - Represents the overall structure of the JSON file.

2. **`MemberDTO`**
   - Represents a leaderboard member. It ensures that invalid members are skipped during decoding.

---

## PrizeLogic: Determining Winners

The `PrizeLogic` class provides functionality for determining leaderboard winners based on specific sorting and filtering criteria. It uses a modular design with modifiers to allow flexibility in defining rules.

### Key Components

1. **`PrizeLogic`**
   - Initializes with a list of `Member` objects.
   - Applies modifiers to sort and filter members.
   - Returns the list of winners based on the applied rules.

2. **Modifiers**
   - **`SortByScore`**: Sorts members by their scores, with tie-breaking strategies:
     - `firstToGetStar`: Prioritizes members who earned stars earlier.
     - `name`: Alphabetically sorts by member names in case of ties.
   - **`TakeFirst`**: Limits the number of winners to the specified count.

### Example Usage

```swift
let prizeLogic = PrizeLogic(members: members)
    .sortByScore(tieSolvingStrategy: .firstToGetStar)
    .takeFirst(3)
let winners = prizeLogic.getWinners()
```

### Output Example

Given a list of members, the above code sorts them by score (with ties resolved by who earned stars first) and selects the top 3 winners.


## Contributing

Feel free to open issues or submit pull requests for bug fixes or new features.
