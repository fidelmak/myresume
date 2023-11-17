import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String projectName;
  final List<String> images;
  final String githubRepoUrl;

  ProjectCard({
    required this.projectName,
    required this.images,
    required this.githubRepoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Use the constraints to make the layout responsive
          double imageHeight = constraints.maxWidth > 600 ? 200.0 : 150.0;
          double fontSize = constraints.maxWidth > 600 ? 24.0 : 20.0;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Images
              Container(
                height: imageHeight,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.network(images[index]),
                    );
                  },
                ),
              ),
              // Project Name
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  projectName,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // GitHub Repo Link
              Padding(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Open GitHub Repo URL
                    // You can use a package like url_launcher for this purpose
                  },
                  child: Text('GitHub Repository'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
