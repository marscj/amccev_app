import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:mine_flutter/wp/src/utils.dart';

import 'embedded.dart';

class Post extends Equatable {
  ///The date the object was published, in the site's timezone.
  final String? date;

  ///The date the object was published, as GMT.
  final String? dateGmt;

  ///The globally unique identifier for the object.
  final String? guid;

  ///Unique identifier for the object.
  final int? id;

  ///URL to the object.
  final String? link;

  ///The date the object was last modified, in the site's timezone
  final String? modified;

  ///The date the object was last modified, as GMT.
  final String? modifiedGmt;

  ///An alphanumeric identifier for the object unique to its type.
  final String? slug;

  ///A named status for the object.
  ///
  /// One of: "publish", "future", "draft", "pending", "private"
  final String? status;

  ///Type of Post for the object.
  final String? type;

  ///A password to protect access to the content and excerpt.
  final String? password;

  ///Permalink template for the object.
  final String? permalinkTemplate;

  ///Slug automatically generated from the object title.
  final String? generatedSlug;

  ///The title for the object.
  final String? title;

  ///The content for the object.
  final String? content;

  ///The ID for the author of the object.
  final int? author;

  ///The excerpt for the object.
  final String? excerpt;

  ///The ID of the featured media for the object.
  final int? featuredMedia;

  ///Whether or not comments are open on the object.
  ///
  /// One of: "open", "closed"
  final String? commentStatus;

  ///Whether or not the object can be pinged.
  ///
  /// One of: "open", "closed"
  final String? pingStatus;

  ///The format for the object.
  ///
  /// One of: "standard", "aside", "chat", "gallery", "link", "image", "quote", "status", "video", "audio"
  final String? format;

  ///Meta fields.
  final dynamic meta;

  ///Whether or not the object should be treated as sticky.
  final bool? sticky;

  ///The theme file to use to display the object.
  final String? template;

  ///The terms assigned to the object in the category taxonomy.
  final List<int>? categories;

  ///The terms assigned to the object in the post_tag taxonomy.
  final List<int>? tags;

  final List<Embedded>? embedded;

  final MetaBox? metaBox;

  final int? orderid;

  Post(
      {this.date,
      this.dateGmt,
      this.guid,
      this.id,
      this.link,
      this.modified,
      this.modifiedGmt,
      this.slug,
      this.status,
      this.type,
      this.password,
      this.permalinkTemplate,
      this.generatedSlug,
      this.title,
      this.content,
      this.author,
      this.excerpt,
      this.featuredMedia,
      this.commentStatus,
      this.pingStatus,
      this.format,
      this.meta,
      this.sticky,
      this.template,
      this.categories,
      this.tags,
      this.embedded,
      this.metaBox,
      this.orderid});

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
        date: map['date'],
        dateGmt: map['date_gmt'],
        guid: map['guid']['rendered'],
        id: map['id'],
        link: map['link'],
        modified: map['modified'],
        modifiedGmt: map['modified_gmt'],
        slug: map['slug'],
        status: map['status'],
        type: map['type'],
        password: map['password'],
        permalinkTemplate: map['permalink_template'],
        generatedSlug: map['generated_slug'],
        title: Utils.renderHtml(map['title']['rendered']).replaceAll("\n", ""),
        // content: Utils.renderHtml(map['content']['rendered']),
        content: map['content']['rendered'],
        author: map['author'],
        excerpt:
            Utils.renderHtml(map['excerpt']['rendered']).replaceAll("\n", ""),
        featuredMedia: map['featured_media'],
        commentStatus: map['comment_status'],
        pingStatus: map['ping_status'],
        format: map['format'],
        meta: map['meta'],
        sticky: map['sticky'],
        template: map['template'],
        categories: List<int>.from(map['categories']),
        tags: List<int>.from(map['tags']),
        embedded: map['_embedded'] != null &&
                map['_embedded']['wp:featuredmedia'] != null
            ? map['_embedded']['wp:featuredmedia']
                .map<Embedded>((json) => Embedded.fromMap(json))
                .toList()
            : null,
        metaBox: metaBoxMap(map),
        orderid: int.parse(map['meta_box']['orderid']));
  }

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(date: $date, dateGmt: $dateGmt, guid: $guid, id: $id, link: $link, modified: $modified, modifiedGmt: $modifiedGmt, slug: $slug, status: $status, type: $type, password: $password, permalinkTemplate: $permalinkTemplate, generatedSlug: $generatedSlug, title: $title, content: $content, author: $author, excerpt: $excerpt, featuredMedia: $featuredMedia, commentStatus: $commentStatus, pingStatus: $pingStatus, format: $format, meta: $meta, sticky: $sticky, template: $template, categories: $categories, tags: $tags)';
  }

  @override
  List<Object?> get props => [id];
}

MetaBox? metaBoxMap(json) {
  dynamic map = json['meta_box']['video_lftt4ne9hkf'];

  if (map == null) return null;

  if (map is Iterable) {
    return null;
  }

  List<Map<String, dynamic>> list = [];

  map.forEach((key, value) => list.add(map[key]));

  if (list.length > 0) {
    return list.map((f) => MetaBox.fromJson(f)).toList().first;
  }

  return null;
}

class MetaBox {
  String? ID;
  String? src;
  String? type;
  String? title;
  String? caption;
  String? description;
  String? image;

  MetaBox(
      {this.ID,
      this.src,
      this.type,
      this.title,
      this.caption,
      this.description,
      this.image});

  MetaBox.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    src = json['src'];
    type = json['type'];
    title = json['title'];
    caption = json['caption'];
    description = json['description'];
    image = json['image']['src'];
  }
}

List<Post>? parsePosts(dynamic data) {
  if (data is String) {
    List<Post>? data1 = jsonDecode(data)
        .cast<Map<String, dynamic>>()
        .map<Post>((json) => Post.fromMap(json))
        .toList();

    data1?.sort((left, right) {
      return left.orderid!.compareTo(right.orderid!);
    });

    return data1;
  } else {
    List<Post>? data1 = data
        .cast<Map<String, dynamic>>()
        .map<Post>((json) => Post.fromMap(json))
        .toList();

    data1?.sort((left, right) {
      return left.orderid!.compareTo(right.orderid!);
    });

    return data1;
  }
}

// "meta_box":{
//     "video_lftt4ne9hkf":
//       {
//         "31188":{
//           "ID":"31188",
//           "src":"https:\/\/www.mecloudlab.com\/wp-content\/uploads\/2021\/07\/WHATISIPFS.mp4",
//           "type":"video\/mp4",
//           "title":"WHATISIPFS",
//           "caption":"",
//           "description":"",
//           "meta":{
//             "length_formatted":"4:10"
//           },
//           "dimensions":{
//             "width":1920,"height":1080
//           },
//           "image":{
//             "src":"https:\/\/www.mecloudlab.com\/wp-includes\/images\/media\/video.png","width":48,"height":64
//           },
//           "thumb":{
//             "src":"https:\/\/www.mecloudlab.com\/wp-includes\/images\/media\/video.png","width":48,"height":64
//           }
//         }
//       }
//   }
