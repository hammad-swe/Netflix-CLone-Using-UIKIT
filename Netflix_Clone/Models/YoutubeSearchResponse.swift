//
//  YoutubeSearchResults.swift
//  Netflix_Clone
//
//  Created by Hammad Ali on 01/04/2026.
//

import Foundation

/*
  {
      etag = "OQA5120JYWpoTsm0_HronDonhEo";
      items =     (
      );
      kind = "youtube#searchListResponse";
      pageInfo =     {
          resultsPerPage = 0;
          totalResults = 0;
      };
      regionCode = PK;
 }
 */

struct YoutubeSearchResponse: Codable, Sendable{
    let items: [VideoElement]
    
    
}
struct VideoElement: Codable, Sendable{
    let id : idVideoElement
}

struct idVideoElement: Codable , Sendable{
    let kind: String
    let videoId: String
}
