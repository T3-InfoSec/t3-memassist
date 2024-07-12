# t3-memassist
This repository contains the T3 Vault Memorization Assistant module, designed for critical memorization tasks using principles from Anki and SuperMemo. This module focuses on two distinct types of memorization:  Memorizing 6 critical words. Recognizing 16 critical images, shapes, sounds, or fractals.
It is a simple module to help manage memorization cards using the spaced repetition algorithm (FSRS).

### Features
Create, add, retrieve, update, and delete memo cards.
Hash nodes for secure and efficient comparison.
Track due dates for cards to notify users when a card needs to be reviewed.
Store and manage memo cards using Hive database. The data stored for each MemoCard includes:
- nodeHash: A hashed representation of the node, used for secure comparison with the correct node hash.
- due: The date and time when the card is due for the next review, compared with the system date to notify the user.
To facilitate this storage, a MemoCardDAO class is defined and used for serialization and deserialization.
The necessary adapter file memo_card_dao.g.dart is included in the repository. However, if you make changes to the MemoCardDAO class, you need to regenerate the adapter file by running the following command:
```bash
dart run build_runner build
```
This command will generate the memo_card_dao.g.dart file, which contains the adapter necessary for Hive to properly handle this data object.

### Tests
Unit Tests
Unit tests are provided to ensure the correct functionality of the application. The repository includes tests for the data source and the repository itself.

Data Source Tests
These tests cover the basic CRUD operations on memo cards, ensuring that data is correctly stored, retrieved, and deleted from the Hive database.

Repository Tests
Repository tests ensure that the higher-level operations involving business logic are correctly executed. Mocks are used to isolate and test these operations.

A file for mocks, hive_memo_card_repository_test.mocks.dart, is also included in the repository. However, if there are changes to the interfaces or classes being mocked, you need to regenerate the mocks by running the following command:

```bash
dart run build_runner build
```
This will update the hive_memo_card_repository_test.mocks.dart file with the necessary mock classes.

Running Tests
To run the tests, use the following command as usual from root directory:

```bash
dart test
```
This command will execute all unit tests and provide a report on their status.

### Examples
There are examples of how to use the module in the examples directory
