<script lang="ts">
  import Bar from "../../../../lib/bar.svelte";
  import Source from "../../../../lib/source.svelte";

  const sidemargins = 50;
  const innermargains = 20;
  const screenwidth = 1399;
  const height = ( screenwidth / 16 ) * 9;
  const top = ( 1080 - height ) / 2;
  const bottom = top + height;
  
</script>

<main >
  <Source topy={top} bottomy={bottom} leftx={sidemargins} rightx={sidemargins + screenwidth}/>
  <Source topy={top} bottomy={bottom} leftx={sidemargins + screenwidth + innermargains} rightx={1920 - sidemargins}/>
  <Bar></Bar>
</main>

<style lang="scss">

</style>