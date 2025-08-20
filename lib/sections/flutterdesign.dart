import 'package:flutter/material.dart';
import 'package:flutter_application_1/sections/button_section.dart';
import 'package:flutter_application_1/sections/image_section.dart';
import 'package:flutter_application_1/sections/text_section.dart';
import 'package:flutter_application_1/sections/title_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My first Design',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Layout'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Image Selection
              ImageSection(
                image: Image.network(
                  'https://images.unsplash.com/photo-1754962847589-206a31ca113e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  height: 450,
                  fit: BoxFit.cover,
                  width: 450,
                ),
              ),
              TitleSection(
                name: 'Oeschinen Lake Campground',
                location: 'Kandersteg, Switzerland',
                data: '41',
                icon: Icons.star,
              ),
              // ButtonSection(),
              TextSection(
                data:
                    'Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc. In reality, though, the unity and coherence of ideas among sentences is what constitutes a paragraph. A paragraph is defined as “a group of sentences or a single sentence that forms a unit” (Lunsford and Connors 116). Length and appearance do not determine whether a section in a paper is a paragraph. For instance, in some styles of writing, particularly journalistic styles, a paragraph can be just one sentence long. Ultimately, a paragraph is a sentence or group of sentences that support one main idea. In this handout, we will refer to this as the “controlling idea,” because it controls what happens in the rest of the paragraph.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
