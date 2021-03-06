# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


module Google
  module Cloud
    module Videointelligence
      module V1beta2
        # Video annotation request.
        # @!attribute [rw] input_uri
        #   @return [String]
        #     Input video location. Currently, only
        #     [Google Cloud Storage](https://cloud.google.com/storage/) URIs are
        #     supported, which must be specified in the following format:
        #     `gs://bucket-id/object-id` (other URI formats return
        #     {Google::Rpc::Code::INVALID_ARGUMENT}). For
        #     more information, see [Request URIs](https://cloud.google.com/storage/docs/reference-uris). A video
        #     URI may include wildcards in `object-id`, and thus identify multiple
        #     videos. Supported wildcards: '*' to match 0 or more characters;
        #     '?' to match 1 character. If unset, the input video should be embedded
        #     in the request as `input_content`. If set, `input_content` should be unset.
        # @!attribute [rw] input_content
        #   @return [String]
        #     The video data bytes.
        #     If unset, the input video(s) should be specified via `input_uri`.
        #     If set, `input_uri` should be unset.
        # @!attribute [rw] features
        #   @return [Array<Google::Cloud::Videointelligence::V1beta2::Feature>]
        #     Requested video annotation features.
        # @!attribute [rw] video_context
        #   @return [Google::Cloud::Videointelligence::V1beta2::VideoContext]
        #     Additional video context and/or feature-specific parameters.
        # @!attribute [rw] output_uri
        #   @return [String]
        #     Optional location where the output (in JSON format) should be stored.
        #     Currently, only [Google Cloud Storage](https://cloud.google.com/storage/)
        #     URIs are supported, which must be specified in the following format:
        #     `gs://bucket-id/object-id` (other URI formats return
        #     {Google::Rpc::Code::INVALID_ARGUMENT}). For
        #     more information, see [Request URIs](https://cloud.google.com/storage/docs/reference-uris).
        # @!attribute [rw] location_id
        #   @return [String]
        #     Optional cloud region where annotation should take place. Supported cloud
        #     regions: `us-east1`, `us-west1`, `europe-west1`, `asia-east1`. If no region
        #     is specified, a region will be determined based on video file location.
        class AnnotateVideoRequest; end

        # Video context and/or feature-specific parameters.
        # @!attribute [rw] segments
        #   @return [Array<Google::Cloud::Videointelligence::V1beta2::VideoSegment>]
        #     Video segments to annotate. The segments may overlap and are not required
        #     to be contiguous or span the whole video. If unspecified, each video
        #     is treated as a single segment.
        # @!attribute [rw] label_detection_config
        #   @return [Google::Cloud::Videointelligence::V1beta2::LabelDetectionConfig]
        #     Config for LABEL_DETECTION.
        # @!attribute [rw] shot_change_detection_config
        #   @return [Google::Cloud::Videointelligence::V1beta2::ShotChangeDetectionConfig]
        #     Config for SHOT_CHANGE_DETECTION.
        # @!attribute [rw] explicit_content_detection_config
        #   @return [Google::Cloud::Videointelligence::V1beta2::ExplicitContentDetectionConfig]
        #     Config for EXPLICIT_CONTENT_DETECTION.
        # @!attribute [rw] face_detection_config
        #   @return [Google::Cloud::Videointelligence::V1beta2::FaceDetectionConfig]
        #     Config for FACE_DETECTION.
        class VideoContext; end

        # Config for LABEL_DETECTION.
        # @!attribute [rw] label_detection_mode
        #   @return [Google::Cloud::Videointelligence::V1beta2::LabelDetectionMode]
        #     What labels should be detected with LABEL_DETECTION, in addition to
        #     video-level labels or segment-level labels.
        #     If unspecified, defaults to `SHOT_MODE`.
        # @!attribute [rw] stationary_camera
        #   @return [true, false]
        #     Whether the video has been shot from a stationary (i.e. non-moving) camera.
        #     When set to true, might improve detection accuracy for moving objects.
        #     Should be used with `SHOT_AND_FRAME_MODE` enabled.
        # @!attribute [rw] model
        #   @return [String]
        #     Model to use for label detection.
        #     Supported values: "builtin/stable" (the default if unset) and
        #     "builtin/latest".
        class LabelDetectionConfig; end

        # Config for SHOT_CHANGE_DETECTION.
        # @!attribute [rw] model
        #   @return [String]
        #     Model to use for shot change detection.
        #     Supported values: "builtin/stable" (the default if unset) and
        #     "builtin/latest".
        class ShotChangeDetectionConfig; end

        # Config for EXPLICIT_CONTENT_DETECTION.
        # @!attribute [rw] model
        #   @return [String]
        #     Model to use for explicit content detection.
        #     Supported values: "builtin/stable" (the default if unset) and
        #     "builtin/latest".
        class ExplicitContentDetectionConfig; end

        # Config for FACE_DETECTION.
        # @!attribute [rw] model
        #   @return [String]
        #     Model to use for face detection.
        #     Supported values: "builtin/stable" (the default if unset) and
        #     "builtin/latest".
        # @!attribute [rw] include_bounding_boxes
        #   @return [true, false]
        #     Whether bounding boxes be included in the face annotation output.
        class FaceDetectionConfig; end

        # Video segment.
        # @!attribute [rw] start_time_offset
        #   @return [Google::Protobuf::Duration]
        #     Time-offset, relative to the beginning of the video,
        #     corresponding to the start of the segment (inclusive).
        # @!attribute [rw] end_time_offset
        #   @return [Google::Protobuf::Duration]
        #     Time-offset, relative to the beginning of the video,
        #     corresponding to the end of the segment (inclusive).
        class VideoSegment; end

        # Video segment level annotation results for label detection.
        # @!attribute [rw] segment
        #   @return [Google::Cloud::Videointelligence::V1beta2::VideoSegment]
        #     Video segment where a label was detected.
        # @!attribute [rw] confidence
        #   @return [Float]
        #     Confidence that the label is accurate. Range: [0, 1].
        class LabelSegment; end

        # Video frame level annotation results for label detection.
        # @!attribute [rw] time_offset
        #   @return [Google::Protobuf::Duration]
        #     Time-offset, relative to the beginning of the video, corresponding to the
        #     video frame for this location.
        # @!attribute [rw] confidence
        #   @return [Float]
        #     Confidence that the label is accurate. Range: [0, 1].
        class LabelFrame; end

        # Detected entity from video analysis.
        # @!attribute [rw] entity_id
        #   @return [String]
        #     Opaque entity ID. Some IDs may be available in
        #     [Google Knowledge Graph Search
        #     API](https://developers.google.com/knowledge-graph/).
        # @!attribute [rw] description
        #   @return [String]
        #     Textual description, e.g. `Fixed-gear bicycle`.
        # @!attribute [rw] language_code
        #   @return [String]
        #     Language code for `description` in BCP-47 format.
        class Entity; end

        # Label annotation.
        # @!attribute [rw] entity
        #   @return [Google::Cloud::Videointelligence::V1beta2::Entity]
        #     Detected entity.
        # @!attribute [rw] category_entities
        #   @return [Array<Google::Cloud::Videointelligence::V1beta2::Entity>]
        #     Common categories for the detected entity.
        #     E.g. when the label is `Terrier` the category is likely `dog`. And in some
        #     cases there might be more than one categories e.g. `Terrier` could also be
        #     a `pet`.
        # @!attribute [rw] segments
        #   @return [Array<Google::Cloud::Videointelligence::V1beta2::LabelSegment>]
        #     All video segments where a label was detected.
        # @!attribute [rw] frames
        #   @return [Array<Google::Cloud::Videointelligence::V1beta2::LabelFrame>]
        #     All video frames where a label was detected.
        class LabelAnnotation; end

        # Video frame level annotation results for explicit content.
        # @!attribute [rw] time_offset
        #   @return [Google::Protobuf::Duration]
        #     Time-offset, relative to the beginning of the video, corresponding to the
        #     video frame for this location.
        # @!attribute [rw] pornography_likelihood
        #   @return [Google::Cloud::Videointelligence::V1beta2::Likelihood]
        #     Likelihood of the pornography content..
        class ExplicitContentFrame; end

        # Explicit content annotation (based on per-frame visual signals only).
        # If no explicit content has been detected in a frame, no annotations are
        # present for that frame.
        # @!attribute [rw] frames
        #   @return [Array<Google::Cloud::Videointelligence::V1beta2::ExplicitContentFrame>]
        #     All video frames where explicit content was detected.
        class ExplicitContentAnnotation; end

        # Normalized bounding box.
        # The normalized vertex coordinates are relative to the original image.
        # Range: [0, 1].
        # @!attribute [rw] left
        #   @return [Float]
        #     Left X coordinate.
        # @!attribute [rw] top
        #   @return [Float]
        #     Top Y coordinate.
        # @!attribute [rw] right
        #   @return [Float]
        #     Right X coordinate.
        # @!attribute [rw] bottom
        #   @return [Float]
        #     Bottom Y coordinate.
        class NormalizedBoundingBox; end

        # Video segment level annotation results for face detection.
        # @!attribute [rw] segment
        #   @return [Google::Cloud::Videointelligence::V1beta2::VideoSegment]
        #     Video segment where a face was detected.
        class FaceSegment; end

        # Video frame level annotation results for face detection.
        # @!attribute [rw] normalized_bounding_boxes
        #   @return [Array<Google::Cloud::Videointelligence::V1beta2::NormalizedBoundingBox>]
        #     Normalized Bounding boxes in a frame.
        #     There can be more than one boxes if the same face is detected in multiple
        #     locations within the current frame.
        # @!attribute [rw] time_offset
        #   @return [Google::Protobuf::Duration]
        #     Time-offset, relative to the beginning of the video,
        #     corresponding to the video frame for this location.
        class FaceFrame; end

        # Face annotation.
        # @!attribute [rw] thumbnail
        #   @return [String]
        #     Thumbnail of a representative face view (in JPEG format).
        # @!attribute [rw] segments
        #   @return [Array<Google::Cloud::Videointelligence::V1beta2::FaceSegment>]
        #     All video segments where a face was detected.
        # @!attribute [rw] frames
        #   @return [Array<Google::Cloud::Videointelligence::V1beta2::FaceFrame>]
        #     All video frames where a face was detected.
        class FaceAnnotation; end

        # Annotation results for a single video.
        # @!attribute [rw] input_uri
        #   @return [String]
        #     Video file location in
        #     [Google Cloud Storage](https://cloud.google.com/storage/).
        # @!attribute [rw] segment_label_annotations
        #   @return [Array<Google::Cloud::Videointelligence::V1beta2::LabelAnnotation>]
        #     Label annotations on video level or user specified segment level.
        #     There is exactly one element for each unique label.
        # @!attribute [rw] shot_label_annotations
        #   @return [Array<Google::Cloud::Videointelligence::V1beta2::LabelAnnotation>]
        #     Label annotations on shot level.
        #     There is exactly one element for each unique label.
        # @!attribute [rw] frame_label_annotations
        #   @return [Array<Google::Cloud::Videointelligence::V1beta2::LabelAnnotation>]
        #     Label annotations on frame level.
        #     There is exactly one element for each unique label.
        # @!attribute [rw] face_annotations
        #   @return [Array<Google::Cloud::Videointelligence::V1beta2::FaceAnnotation>]
        #     Face annotations. There is exactly one element for each unique face.
        # @!attribute [rw] shot_annotations
        #   @return [Array<Google::Cloud::Videointelligence::V1beta2::VideoSegment>]
        #     Shot annotations. Each shot is represented as a video segment.
        # @!attribute [rw] explicit_annotation
        #   @return [Google::Cloud::Videointelligence::V1beta2::ExplicitContentAnnotation]
        #     Explicit content annotation.
        # @!attribute [rw] error
        #   @return [Google::Rpc::Status]
        #     If set, indicates an error. Note that for a single `AnnotateVideoRequest`
        #     some videos may succeed and some may fail.
        class VideoAnnotationResults; end

        # Video annotation response. Included in the `response`
        # field of the `Operation` returned by the `GetOperation`
        # call of the `google::longrunning::Operations` service.
        # @!attribute [rw] annotation_results
        #   @return [Array<Google::Cloud::Videointelligence::V1beta2::VideoAnnotationResults>]
        #     Annotation results for all videos specified in `AnnotateVideoRequest`.
        class AnnotateVideoResponse; end

        # Annotation progress for a single video.
        # @!attribute [rw] input_uri
        #   @return [String]
        #     Video file location in
        #     [Google Cloud Storage](https://cloud.google.com/storage/).
        # @!attribute [rw] progress_percent
        #   @return [Integer]
        #     Approximate percentage processed thus far.
        #     Guaranteed to be 100 when fully processed.
        # @!attribute [rw] start_time
        #   @return [Google::Protobuf::Timestamp]
        #     Time when the request was received.
        # @!attribute [rw] update_time
        #   @return [Google::Protobuf::Timestamp]
        #     Time of the most recent update.
        class VideoAnnotationProgress; end

        # Video annotation progress. Included in the `metadata`
        # field of the `Operation` returned by the `GetOperation`
        # call of the `google::longrunning::Operations` service.
        # @!attribute [rw] annotation_progress
        #   @return [Array<Google::Cloud::Videointelligence::V1beta2::VideoAnnotationProgress>]
        #     Progress metadata for all videos specified in `AnnotateVideoRequest`.
        class AnnotateVideoProgress; end

        # Video annotation feature.
        module Feature
          # Unspecified.
          FEATURE_UNSPECIFIED = 0

          # Label detection. Detect objects, such as dog or flower.
          LABEL_DETECTION = 1

          # Shot change detection.
          SHOT_CHANGE_DETECTION = 2

          # Explicit content detection.
          EXPLICIT_CONTENT_DETECTION = 3

          # Human face detection and tracking.
          FACE_DETECTION = 4
        end

        # Label detection mode.
        module LabelDetectionMode
          # Unspecified.
          LABEL_DETECTION_MODE_UNSPECIFIED = 0

          # Detect shot-level labels.
          SHOT_MODE = 1

          # Detect frame-level labels.
          FRAME_MODE = 2

          # Detect both shot-level and frame-level labels.
          SHOT_AND_FRAME_MODE = 3
        end

        # Bucketized representation of likelihood.
        module Likelihood
          # Unspecified likelihood.
          LIKELIHOOD_UNSPECIFIED = 0

          # Very unlikely.
          VERY_UNLIKELY = 1

          # Unlikely.
          UNLIKELY = 2

          # Possible.
          POSSIBLE = 3

          # Likely.
          LIKELY = 4

          # Very likely.
          VERY_LIKELY = 5
        end
      end
    end
  end
end