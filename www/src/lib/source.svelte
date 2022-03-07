<main>
<div class={ classes } style="
    height: {bottomy - topy}px;
    width: {rightx - leftx}px;
    transform: translate({leftx}px, {topy}px);">
    
</div>
</main>

<script lang="ts">
    export let topy: number;
    export let bottomy: number;
    export let leftx: number;
    export let rightx: number;
    export let selected: boolean = false;

    let classes = "source";
    if (selected) {
        classes = "source selected"
    }
</script>

<style lang="scss">
    .source {
        position: absolute;
        background-color: #2E3440;
        border-width: 2px;
        border-color: #5E81AC;
        border-style: solid;
        &.selected{
            border-color: #A3BE8C;
        }
    }
</style>